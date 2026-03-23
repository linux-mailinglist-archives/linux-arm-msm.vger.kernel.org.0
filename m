Return-Path: <linux-arm-msm+bounces-99335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNsZMONywWlkTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:05:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBCD2F96B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2884532E379A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667763AE1BB;
	Mon, 23 Mar 2026 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LthYUu72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aS+tYDU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2C3B4E8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279267; cv=none; b=jfR2fWN5FDLwtq9C8edpi5xLBBOkMzqYsKbejEMHP4EK5XzOaWZv/3OqBZSa2dbkhW+T24zSxzIoYnah7r1MzmUn7uIiAOIsljL/+yawwLISVO8Abeb9X6q7TeR38M8BgoX59hJkoAw8DRdFOWF4GVVVGfxI6UvenGqg0jsdDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279267; c=relaxed/simple;
	bh=nGYPrzjZNMlNg4taQgSi0jKSd8PYHwnflZG4oY0HO8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN6js+PmhiIrHwqVaJfqPkPWsgObyXJYFxjBZGNoBNsP28e7yJtsBfhiO5lVg1ZxdoxfJCr18NP/xX4thvKDG53ArLBpPw1kT+tq83WGZaMN6IXLKfx/Lp5EtxGecn1EnBuCgaVQEEA1qVSg/IsG9htOb65VNtA4GtfkD4SD0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LthYUu72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aS+tYDU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGRDN1473336
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjYIs1caVgKngRzAefEKuLmK2FwOzhuv6kpcbsbBxjE=; b=LthYUu72uNG8O+4F
	wPvd7B9umjr3WCdY1j5w1725KQVAzgyo2A88kheFjTfMDjTMMowfp14io+OQbOP/
	E308e/zTFaT0dhNec191diJnvCifb7nWgKN3/hopSe/LY2O4598cNUBJgfftawHI
	wPhOy8uvVFV5yNyXurgB2D3pEExhEsbZOZa/MBDZ87bTAUypby84DDs4WldPw66S
	FbGXbx8to3oMHdq3+K0tc5mZHdXsqViLgNJKz/qFromtPpWS9SuNHr/kxNo3X+y4
	UdCJvM2I8VBizVgCuMeOzj8WP39vreGV96yki4LRCpu3Ye+e5op6EbxUSuuWfYOG
	ulRzvg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8kwv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:21:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so486945137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279264; x=1774884064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjYIs1caVgKngRzAefEKuLmK2FwOzhuv6kpcbsbBxjE=;
        b=aS+tYDU4D0to5hjTziXF5KsuIPmQPBVu6ogVUd6A1q1ZpDMcn/ocTL5GVTFp4rnlLW
         ViZG8KdeNK4B4WIBr9aDR0+N4Y1yj+awVFjBiR/GiAnLvS40pe/7Cz7GGm7BDcn4+1gb
         Bu9cWNybyhJ4N55cMgBL4SA7C8Jr9EPrA4AtxwnCM2QSIJncKmBsa9tL6q4bX/H7i65+
         fD0aY8cAaEIACRex03+/q7VdxyuayssAh1H8wx0wgCwLTw5VARFadt2swwfa2d+oMw4M
         8uQsTKcXrbz5bMLj0Q3ow1O/dmOEtALhIdla1FaxK9/s9d9S//Px+PK43CyJH6HWbHXA
         6KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279264; x=1774884064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjYIs1caVgKngRzAefEKuLmK2FwOzhuv6kpcbsbBxjE=;
        b=ASHhy7MVNzJJ1Fr7zQB4Nux67yJziKwMv0SCSYxaYcYyYTxW2YvBWe5GcrH+OJL0O3
         7xbCnOyp7s2ly/VB+oKMVdq+w6cNtkN6L0N2HatvLHkLVWhUtZG0kQExZ9W+6lhIv/TE
         Oa1QPKo+hBHtO3Yy0yAYSSFIHRvrjlSI4uqyiZBBOJisINs72NGG4Ue1w7ConFaoGBgu
         TGhPQtg85tltO49qrxrcIVeIFm778RVs5Ya0skkksT8VSthJGzX9As+4uS/K4MvnPinS
         5eAzPoLzqytU7mRX1SyLynpZRw0sj0Dt8WkzeqnxNYCvh0IAzbnkceq+LpQrd8ecB7aF
         0ylw==
X-Gm-Message-State: AOJu0YwEdQO4XU1sliC27oVfzqu4WmH/o/tYsHlMBYIiBL6l+mndaVnh
	vNFnT0/jTVd+cSfqF+PltUyVjZMFyyAHTfqm4mKqxuYAyD+YAoJ3/Jlw2VJTyICWsnh8tUKmEsx
	Z+FI9Dcv5hEz3T4xkFlzqoNcZ7KXsPn7N/bEOMsJ9+usk12x0kjqvO22TlhY22xdQaXe0
X-Gm-Gg: ATEYQzyViy9vAhPeeuQQyS8RgyXZXGVW8pvXQdSDIbs1ochWvsSCD4Frc3Ov2YQHC7W
	W+QabuXX8saHIALq0hwi6EQk8Xv373plvnZWOb4nxnJOFBXp+KM3l1ZFW7sF4cXdto4usdnkIKq
	ux2yq+cXZDjC0aRjnsr2q1hn+WOrU1AyMdXFPRzcPseVAJk6X1MHJdzAfauUJ2GL4GR2V7xyug8
	aVxAuTP5FBj92bGXaQMQyfjcK5M3grMS48OpnehCqWLw/KuSYYP9I3xjH17TE8Sf68PSSKDE6v5
	Hk80VAcoqDDpjMGHo/zBRNGaW/Ym78u9p6e28trjWCMOcJwZNmsopwLDejXsXjXDwPhhnXMN+Zq
	e3TCxsa2vyGmgDn3F0Ukuv5ytfb5l/YyPSv4vmKCExc8LXK7uE7rHIWGaSuRE0TNehwqxxZ85d4
	yHML4=
X-Received: by 2002:a05:6122:362a:b0:56b:6a54:1a24 with SMTP id 71dfb90a1353d-56cde40a346mr2499667e0c.2.1774279264102;
        Mon, 23 Mar 2026 08:21:04 -0700 (PDT)
X-Received: by 2002:a05:6122:362a:b0:56b:6a54:1a24 with SMTP id 71dfb90a1353d-56cde40a346mr2499650e0c.2.1774279263713;
        Mon, 23 Mar 2026 08:21:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98416ac27asm384992666b.59.2026.03.23.08.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:21:02 -0700 (PDT)
Message-ID: <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:21:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors with
 Hamoa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfXxSbvGEknqTQx
 t6mcrmY6Htvy6nnWr7RKpGCqGUM/zWL/vJm6owUu5dzLluVzCPlLjAWjKNd9ufp1zDG330OggRk
 dHojGzmekEtrO7Arh+Mgl1E8cne+hv+syhEaY75y1VTOUiKMxh5J6xpnQDOEhBfJQOu4MLEd8uw
 +R4j/LLX20+LIFxzluQbqviP0ls59lhiNgvCk63rS+eDISdvNNOMg4XU8fUl+DESY6tIj3pCxQQ
 49p+TmRpEdeL7msd8DK648s8oVxqQnT9EPAATMHuzkTAEhN6DSlZvwAqTKw4va/Mq0/9XiortMQ
 c94xsZiMHWUMbz7BqRWSDcZPRjESea6gkpZPYTM604AoByvxBmTjSd/PgCwB+bs/O2s2lB2Mvdj
 SJzEK7Cs+lhd7QCf1orBQFug8DRAM7Ce3fICyQcw5NWUz9DsUzCTYss6Hy9tTvwS/smCB19HMq6
 iqi/ZJHby8rF1vS59Qw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c15a61 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XhOjOICij2rE6NPUThUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: kn07xZuFim01gGpAOxf0kRBtK6gPdgg5
X-Proofpoint-GUID: kn07xZuFim01gGpAOxf0kRBtK6gPdgg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99335-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DBCD2F96B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
> Hamoa and Purwa have pretty close thermal zones definitions. The major
> difference is that several zones are absent (because of the lack of the
> CPU cluster) and several zones use tsens2 instead of tsens3.
> 
> Instead of completely duplicating thermal zones for Purwa, reuse themal
> zones from Hamoa, patching them where required.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Slightly reluctantly:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

(confirmed with dtx_diff)

Konrad

