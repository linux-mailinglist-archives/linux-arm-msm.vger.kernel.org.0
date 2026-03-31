Return-Path: <linux-arm-msm+bounces-100965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKEZD8CFy2l4IgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:28:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15D3661AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F51A3039694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDB73BD62A;
	Tue, 31 Mar 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sq8enHny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zp9xgnMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA063D647F
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944774; cv=none; b=ap5WzAFcmz8dctAojmsLINu3znlMRU7lvLES4ww/bbuj4/Yi4m5XQUn0H72/PGupFE0wCuu653WmZ4shzZ5J38dI2zktmJVhq+I7GAM9pQDm2oy+s4VfbmiJW9xn/EY7HTEnNQsBOcBhBJiT+H/lbE51ywppxrDtf8hsLxdZPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944774; c=relaxed/simple;
	bh=MrpfVQAtlKn6pPN7wuY2z9ZbZDqOvXvS9V2ILVLhpSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q25cy+TsVivqM8jPO/IC7gpbLfFnc9GSxuXgTdsPa4fFirgvWrLJQG7LiLFKvNd8Q0NKqHk3xgimGSgpoNS9kpO1cl/Jd5VFsXzHRQnf12x11PDbqQ+N93Z8YDyO3ShtXDmGqa6Ta2qMWRG0r5PCYI3d1kvwP0getmtZzGF/zFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sq8enHny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zp9xgnMV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7sAoh432749
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mk4lfVHBGntLyWxGlRgv2XqqqWoovfGZOwVg3346vwo=; b=Sq8enHnyg6/+Qhrk
	Rbl2vngOd2uxjbwBQ0lkFCq3IFJnlsMfjTc2LZxJerWRCmMns5znRl/oi7rK6RLC
	WSGG5GnYAtl5IK/NFD0AG2rMCYqEXSWlQoXUB6W0pu9im3xUJ8JqbxFy2yiZIQkK
	wQb2dRnszEoOUvRK1fcpZBFh+Q2Ky39EHNtkGaQQVgmA/rDniC3anzSPS2Pru35L
	Ov4EbnT7ZiWOvxkhtGxVUa/zKD7JGOnJ87+Frw1rlr2NzYex9N2Bq+NKSH3kGALm
	n61zvYXnn3ilgtX2e+Xor7h5drlKuuPdRq4uMa1mGc0tL2p378eBGILVLimu2Dao
	xLm1Yg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhcvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:12:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccb129547so18997516d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944771; x=1775549571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mk4lfVHBGntLyWxGlRgv2XqqqWoovfGZOwVg3346vwo=;
        b=Zp9xgnMVQ+FTrCpNZ0sXDtz0K/Yy4MGeceIilMk2kd7WOVtTRD+giH8BP7peOj3OW9
         Fr4R5ocmJXAqMOipna5nLFJdKTlrYDrcJnQJYxM+aiCGZ9VtEPlgNPXysqClrhflafU3
         k1EkYsymTNiu22huNnjh6gBx6tlwLFTkCRDXo/2RlzgzFmFAGexHgDnF9zXCScyt/cep
         mxPm1qfGaxNC/FFP8eN+cSaBzSiyGTpLMVvTInoSSs0viRYHllIXDHUzgvm2TAUnQmYs
         1Q2RcjHpackSisa13u+Isu3vjn+i+WbWv5+ycUiHfEQ6ylR3geakXVHWVE0dT6hzXG/9
         gRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944771; x=1775549571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mk4lfVHBGntLyWxGlRgv2XqqqWoovfGZOwVg3346vwo=;
        b=bVKeeVxoyqpjDii2uMHfRT/fiwJb6Q+OCs0mxY8TLZmTBZDqWJOqQMnbKaDNeOzqa+
         Z1ea0CjTk3rmcJa8fr6J/MpVcv0q8SnB0+GO6royk0/mCxQ+8X2CpyZZFyBPO4Myln69
         Iw54LCGJP/i58rB55bPwJAIQxinBaNapcYUrlXF/MZ0gfD9aIt5nGFsCwJBNbJx6f3nD
         8VS7kA3xjrJg6kiPEN1PR+uwsyac4pRMPn7oVbjslVckXjpoal2l8qHLg6tzYytJ0aBB
         S3j6D/nyr2hBZH6omlyj3q6j/S89VCtoDekyaOFegFNdEyv0ODOrWm4OnkFC/5p2mji/
         9D1A==
X-Forwarded-Encrypted: i=1; AJvYcCXDvj93Hy/6r5sfrU5jp5yN9aBdrptrj+0+NLrMcV5poe7I/qlj3q2wziN2qndoHHol3v7wMQbbzH1E62mg@vger.kernel.org
X-Gm-Message-State: AOJu0YwieX6NACipug8NPBoBNCbw3KPDbcxOSYJxTI5gdyUSHwTr1HUC
	ViC6jm1uBBp2dXZWQV/tDxYY/oWwzfzVYRs2wE+B+9IrVaC0DZIYkWONZ1i7m04IOZX6lfvIEk9
	rz3Gvnq1/9mpjZUbbC4QVaDSMSpQZna0th5pEJw33Y4s8yC0neHj26e3yc+DbZrf79XiO
X-Gm-Gg: ATEYQzyAnaI5n9LjyOp4F/bbPJxHxNWK3C3moYpTNlg4fRLSN0Y/N94F/C15S5sChYV
	jBCJzKE8Y0RRmljLigahGnYDu6Gd+QXAduACfTxJrUsCWwRgEjzelF0AKETxQ733IRwP9uYtDJr
	d6DDQeYnr6e8i0znWy+Y13lKoeUVggJIk6bPaP6ouHNlXYosQ+vFl9DX6ePelD9oi95hf+coKNf
	pIn7pVfLvQ2kpcimBhK74k2gKAyLMzguNGcS5lkjgRpVBx5X/AqVokM83vZLm0GUFIOMfVUorUL
	M8X3zblT89zETI3vP5feWiBQKNDlaUKb0QkHgthkSx7ITE05BBOXdbqSzNYKnTJSXwYnPOo2az+
	lTo0WDodZd9PYiZ1ljFQFDr1vx7KcB2d2CZX6/7kkQoHzG61UspTPmWVM234NWs9X2Xv8My4A5Z
	hRvzI=
X-Received: by 2002:ad4:5aa5:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a22cc32bc5mr52131626d6.1.1774944770855;
        Tue, 31 Mar 2026 01:12:50 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a22cc32bc5mr52131386d6.1.1774944770482;
        Tue, 31 Mar 2026 01:12:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225f1esm378843466b.61.2026.03.31.01.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:12:49 -0700 (PDT)
Message-ID: <dca38974-629a-46df-ab72-4b11517d2c7b@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:12:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix
 inconsistent USB PHY node naming
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260331060107.501561-1-tessolveupstream@gmail.com>
 <20260331060107.501561-3-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331060107.501561-3-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb8203 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bZZ6jWn36qTL26E8i_kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NyBTYWx0ZWRfX24OBa5m83Iy4
 Rh3ctFav4rvTCIEYhnHhzaUuDVG2bQdSaZiP98rczQgIM/CICOb6LtCYIJLDAGHmWWZ4UHVJogq
 iXmM3JzGJcOBtDm5gbtQ3uXGO5vNoQycotBXrI0ZoUIb4ClJSj4T1ldXKaXxs9CEfFjTVUdxuDg
 2jnbnNZeiiGmsYMJKlw3+mECGRda8oU/WLZhAT+vFMQX4oVEV9sXzlH6vinNjQGQj8gwm0/NtZs
 tvqYlWq6E/+IP3dN2U3n5huWvd6jg5HYtS3wCgDiG73TvZgCr7Zu0KVcU/gmW7PEB2ohE4iLgt3
 O/zBMSPc64Vus4NjMekKzu2TwlrVpHvZ85eeWImBdAb9JshW0SqmXa1VclpgiLu+xGRRi73ulgH
 b8QpvWFT6yJPI9cJ9LCJsjYXhR89EiEYy320Ov+u4srSZCdPYFfGZ8bO+wNC01DvywCqcfdKi+k
 LyG5hCdEbsp+XdacZIQ==
X-Proofpoint-GUID: mlxY4dD0JL2c7hHVjlrNH2JdDEYevYb4
X-Proofpoint-ORIG-GUID: mlxY4dD0JL2c7hHVjlrNH2JdDEYevYb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-100965-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C15D3661AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 8:01 AM, Sudarshan Shetty wrote:
> The USB PHY nodes has inconsistent labels as 'usb_1_hsphy'
> and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
> This patch renames them to follow a consistent naming
> scheme.
> 
> No functional changes, only label renaming.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

