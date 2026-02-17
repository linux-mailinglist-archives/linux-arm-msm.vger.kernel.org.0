Return-Path: <linux-arm-msm+bounces-93135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJLoOA1VlGl3CgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:46:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 205B514B8B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7F5B3003BFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37BD286890;
	Tue, 17 Feb 2026 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pb/s5frp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6+bJaU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F0526F2B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328777; cv=none; b=qO8YBNz7YU1mETH9THfrIZiAjsuBXTkSUTDi5eu+JFX8fVqqRY0Lil4qGkY1JKZwf1ce6XcDGWTnsHBju3ENPfDWpqOxsRLzugVJ+Av1qemngKYZFNdbW07ZNqIThh/tSyw2RiU7B3XPckFSPx9dRe956SE2DZdOpu936Y1PXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328777; c=relaxed/simple;
	bh=sGTzj61xYJ1EFVupvf0NZw/NajElGdUjp1JLXk9f4yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PO6UlunRWWd52aVo5Yp0Ixpjg6hUyPoAbOZkZ2BPakeZeQ+pALdahmHMzTbSQtD4+kbAsoGwFhyN8ISPvAxe7TtH8kTdX3H4UfaPovH1++/iRcRawKoLpFNecxaFYZ/jlvY0kC0HsPg6AMApo5EdaVXFDj/hQcFpgms1TFdCYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pb/s5frp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6+bJaU5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBMggD1613313
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCk9OpWnJfO2diGe6paKGh1+BeBt+jweQ3ZEQMMxtpg=; b=Pb/s5frp4NM4keU9
	ilYpufn0l4Bz1pYY6VYR/LurTD0FIHXtS+ZpKXuCWs8ze0v/b0NDj9eOUzwmZ0Bg
	8w9vdufyguK9g0HIW4dCv9WDHB4Wl3vlV7Rpmi1Z8/VONBIxrEk3Yzn/1yD+VoNy
	Dh2EXyYSGzsJJsUOVWSzv6/FNiO6GIzHqlktB2XxiENJ48fq8vrTqPxoDWpr9odb
	nV037rxU/V5Rc0QXwO7OqjKM3fXcsROF3PvoYSpH2MJibP4ar5yehblogfvxzgaA
	iFnwI3mhe1o7rAxVF1eFPu+Judte59GOvz2jAo4fiN6eUijJKtMZ2zpViVNvLfq7
	RvQP2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662t7jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:46:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso308168285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328775; x=1771933575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCk9OpWnJfO2diGe6paKGh1+BeBt+jweQ3ZEQMMxtpg=;
        b=V6+bJaU5Map+jgYKfBhf8b352YER/QYTUyyWD2aHhwiBKpaucDZqWkjVxfF6l6qDSz
         dkSOly9zmiD+rPCnf7NOUkEBStWosWw3bZk1BNw5j3pXyDbj3dX1GUwlghCRfMy7b5sN
         2FK7WsjNTGaMQUvYmGo8xkCOTiQlXXsRA2uuXSk1Q9DjYngeSXz1+pYV3cIlGa5m2KP3
         Ak1Jt21Uh9O6YGpptewlZ37E86/5iMHArBGS3KFXWquNM+rzt4lkc1Vzml1LQb5I3pve
         MafNq2NFks/xb/M5cVtXmgU77EWuhiA4JU903nuddtGlGW5ixuUE5vjZQSnSrQ1NbZkP
         Q9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328775; x=1771933575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCk9OpWnJfO2diGe6paKGh1+BeBt+jweQ3ZEQMMxtpg=;
        b=A00Vv5FGb+uNCiMGV58yOJDCZL4rXEHMAkdAS94e2njhdvHLH2Nx/U2Sa0FBhH779h
         fpEIvSQDejQHMePdntw+HrRy91o76jrLc8eseJPPeIFiGTB4ZXh1cN1y4eO9BonJBcgV
         JyRmWpW2K/rNkFq19oOcfgTRfU8K/O7c1fBbAW6KBX9kcEMTSm6vdsID4N1pih1WHQlC
         1SbCIFkvB3fPJLFR6JTwYkrBqpcQXVujzHap6AUZuVG2YjKkLxzR/JYxdUpPFDucpiPN
         e3nHnzbRfneODI/ZeYazUJFfN7LfZ3zRgvevyXwIYFasYxiKrH1nmSdU3MRuX+X2itmC
         91Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVWzOrA/MroY7snfqv/Wy2kcCSiWLZgQ0S/b6ZG7TwQmi4shqxbzna+373Zr5b87nKnvtCau5Z4KxbcB2o6@vger.kernel.org
X-Gm-Message-State: AOJu0YwETHmobT3kqcCb4//qiblSvhzouo/lFSn3hz8bPGbOqNpp0QlR
	wn7K0inxhgDiTbIeYGmDn5a32lTmkVh7xPiAPDj/pDsbo+IKAefXEJlVdJ2a91HbGf6VK53iHWX
	kN2k16ariu68Agx2sn2VvrjUeFtcKZtiP4PyQy+ETbNN3o7RZq6XPr2gr9GQSV34NgCbQ
X-Gm-Gg: AZuq6aLh4vG/7uUVafZVkrPWTcFY7h93tqW8ndzk+QebNDHrNyV2kY0cRIZuMZJt2hb
	h2ob19ws5q1nT3ykQGkMNp3rCxILGYbFsYKXAaHGy21zpyKqfbvFsaMlpbcE/ZBa3WjLW/dK2j1
	WR13E8riU0CncY2gKmsNpy2gNDK+WRaJElTUDKG4f/2aDHB+020taxt6wUi2TF3W+JeoFSKhIcH
	Efy/CTPTVOWj5mGlIJ1Fy/jwblVhtVRAXWEGV7h78IVdGhP5w3/9feuQyNLD+hAWozvU+BdwGuv
	tFMY1z1jd9TsD1VNpE2QBdCr591LhpPWp3zy1RFk5WQ7N3N0FlPn5o7dXLsk9M5QonXeD2607RB
	d8mEhRgiXhnSn102t6TZlnJGxDcFhlh6RV6tlTWg9yikxw6YXhLCckY2LR5y0mEsUAjREblGch9
	Maumg=
X-Received: by 2002:a05:620a:454f:b0:8ca:2e7:56c5 with SMTP id af79cd13be357-8cb40916695mr1244231485a.11.1771328774817;
        Tue, 17 Feb 2026 03:46:14 -0800 (PST)
X-Received: by 2002:a05:620a:454f:b0:8ca:2e7:56c5 with SMTP id af79cd13be357-8cb40916695mr1244228885a.11.1771328774294;
        Tue, 17 Feb 2026 03:46:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385f7asm351610766b.21.2026.02.17.03.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:46:13 -0800 (PST)
Message-ID: <3b9821b4-68df-4f2b-a384-912a2dc98bf7@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:46:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-13-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206174112.4149893-13-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX0MLD2mrnHTE3
 KQvhps6RXMP8xWr9JT+74DHHHbf+/Zxm9ooNLUb8YYTv7Sk2xY/mbUyCMR+Gn3mxWoo4VzzRJ8j
 p9iNKV/7goEIP32pt5BvajI4ir+Wp3VGS449sLVhF+trL+le4Mh+dzqoiBy7V3u9J+lq6LC9ax2
 yfZkTKqz7YmS4/mVylywvis20ti/c08SWies6Iw4JGCCIHgYtBzyCrQWQhcfKgDvjQ7akqEnDEj
 eM7/T4Qd6RpaN94MpfXjHqtzW3XXjntW21Jm/w6loDuy+FieSvFPrUGk8evwIXQWEjKOn3sDpNL
 S+/9BVeKMVMBJpRbd7ftpDrMlGhIO4apKmyShEYQuJGd9GCDSoxJKXuJsqfLejozfvmL8OWT5Yi
 B4CymsyR07Lx4NzvxbhFDQaSInTFI66zixpABuf1KP3Fy/SSNhRU8YwYQly8iuSnoJHlKvKGx3D
 CWr0mcQhs1+rwnEbl1A==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69945507 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pV_FUetQsCUf9QfKx1wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: P4_cXx9zXiELcrYtPdnsCBrUlGf1PYxu
X-Proofpoint-ORIG-GUID: P4_cXx9zXiELcrYtPdnsCBrUlGf1PYxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93135-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 205B514B8B0
X-Rspamd-Action: no action

On 2/6/26 6:41 PM, Praveen Talari wrote:
> To avoid repeatedly fetching and checking platform data across various
> functions, store the struct of_device_id data directly in the i2c
> private structure. This change enhances code maintainability and reduces
> redundancy.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> -	desc = device_get_match_data(&pdev->dev);
> +	gi2c->dev_data = device_get_match_data(&pdev->dev);
> +	if (!gi2c->dev_data)
> +		return -EINVAL;

This is an improvement, but you still need this:

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ae609bdd2ec4..08e5a1917933 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -933,8 +933,8 @@ static const struct i2c_algorithm geni_i2c_algo = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id geni_i2c_acpi_match[] = {
-       { "QCOM0220"},
-       { "QCOM0411" },
+       { "QCOM0220", (kernel_ulong_t)&geni_i2c},
+       { "QCOM0411", (kernel_ulong_t)&geni_i2c },
        { }
 };
 MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);

for this check to not fail

Konrad

