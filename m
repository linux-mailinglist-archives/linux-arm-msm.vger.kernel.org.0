Return-Path: <linux-arm-msm+bounces-91307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB0vBj+kfGmMOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:29:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9977BA896
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9903033AA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36563793D7;
	Fri, 30 Jan 2026 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXAUIgRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCz6bPDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD99378D9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769776180; cv=none; b=iSDTkjRaZapGoCjm8XrRVgb+PwEE9nrrNUbE+/fCpUuXN+PnWN3jnwVbgC5raCpOn7BDhuhpY6I5Cp6U6HJ+BaZTZrGgzQI/uh1Vhq6xMnpJuuDVEo5wRYxqMoSAcAKQUTCaAytWmUg6Zrnfm0VsSuK4hRMirkux+znAbpWwXRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769776180; c=relaxed/simple;
	bh=JkbyxrYkyRVm5anzYwPv6egnAPQl+91/SVNeXxzRxcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sf0PQDo1SLh5QFPqzofriuMu66oylaIA6leGpuDRh4q6HWCl4AcDOTU4Q9l2jMLKsXk+BbUw9TW9IXFglRzhIu5Fzm73RG5XRWkFXhDHOIFDALWqbijt2kxmYwH8Cm5cJyzpPGNEC0/6Cg7S1r7ywnJmIeoBHzeyehCPo50hILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXAUIgRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCz6bPDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UC2hCQ1825998
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfwyPOvS+wpVPPTCUEOdDVk2QBN2pxqX7UqPeosiBA4=; b=ZXAUIgRx4hZ5i4Qt
	bNB3tII/6jRofBBL5JgziPOHw4JXzs7XTmR0lQflwyl4irTOXieYW9q6xMz+E5pM
	qb7foZk7TPJLZvoZYhCtp8I63Bjq7QU+may0LYLmXQzN1B3LJ2RCOEOJBUJe3Urr
	/1x25ALg+ZVQLLsIN0B2Orhljak6vp2owu8nA7VIkW3xzAOQPWYtViy15+mEVdME
	P+8PiltpygB6YBsHdWpVRh3I6aqbn9e6ZfJuk+uY8TvO4E/5V7E+FbgwktAVV4Rt
	SZIZDZjkM/WBcI3g1bALvJcWEQjXbjCBGr2ef5lorQ2R/KZyFGfCpjOkKxRZVtj9
	q9AulQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsmsagy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:29:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so18853385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769776173; x=1770380973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfwyPOvS+wpVPPTCUEOdDVk2QBN2pxqX7UqPeosiBA4=;
        b=BCz6bPDSaJEWvj9qXaBlVRn/PCqNIK+8GutXDkjheAEEacnQEG17OPoB45Ks4MSpYT
         ETjftAmmZZ1jgAHgQv9helnH1PBd1ipbGfRB7161a5fGp321VKwnfhsRJOGheNntZuPk
         fxDoaNVag3VmGZTHY4HWk882tzQU375pIDgS3NUnwkG3Hh7Zsp+XcO93Hg3X0POec36y
         wfnFbEEwbrrgWsXyg2Qys8zZiHc7SANy1rxhPdF+nSNgaXKqlyGhyW3eXjnMICO9Xu02
         VlBX8slljzg8hJbbBt4wwaIFv2pC5R5JpKpLcZ9Kt+a8ST/zRWTv0S8lfnUBpKqc/s6O
         Texg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769776173; x=1770380973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfwyPOvS+wpVPPTCUEOdDVk2QBN2pxqX7UqPeosiBA4=;
        b=Pf7uB+OWYpG/VNO/z8pFosDBOxDu8D3pLxih44iQPiMIm0Vxsjm3KBMK3XlKTdJubV
         bR3ct5rw1HII19O3syodWOn/SzT+n1FH0wgOb03JXReF8n3AYkgRRxZdXGlLJqxwKGLH
         bdwbvQs3Ce9lC4ndLBX2DUZkDjVnE2GYUiGn02FyJ03RhaT4AKuFSbXG7bRrVrcRxYnf
         Lf0GMq60x4MNcII4bhrTRziEVdqNFnmbjoSMMsCvGXgpE/ilVvCdfQoyN08v3QMO05qa
         KqdoBITovYsdiqZ5bIK/dfpY9p+3bJpI7Iy4Yfcyg+mA1X2X4Ca3EwUaw7nRtuwyUfrD
         ECcg==
X-Forwarded-Encrypted: i=1; AJvYcCWc7AlXzequSe6NkMPb91FYfDkH6rSJ2cS9yfGg9VhYsaK8ugZDhnqcDbdE2svIcqg97S9oWigClgXUyfHH@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTpnD1jFFzV/gtUhw50AW81NlWu4xuDK2AbGSxaK/NhTPo7g3
	s4zzHdmSUJTpq4KjzMBZH24dCQyLhZWlIPXxiCie2ITqfd4wXVJXIs/DSSq3H64mtkHy4TaETqE
	xn1nv3m0FQzyqRAZVTmSDH512qgC+2QoCMPCT2o61ykhF05LJlSztTSxpeXXnx9f4gyZQ
X-Gm-Gg: AZuq6aIRjQEk3Dwdyp7/Y+tDpmcsBlRQPK0YwQeReiQSf9XowlccRpSwKouymMRbDvw
	euux4Bon4Y2Dp0qy+IOnI2okKfTWTXOxQpllzWNy01PKRUp1rNjAboWLVA92s/8bUer2wjxXwn4
	y4mZLDykEi5FXziJRlL9bM3wbd+318fVnQoaURBNMPM4YOYgHDlKdZ3snxu9M6lFKAUJA3EZIah
	kjMXL6EweASGl/QMA1+fmI6kdmY9SWcTPErWbZVhEZmQ6JsiYUljPkVEovW/Lzpg7MS7qUUr0vF
	OFdmSPTHZoyto0v0jXi8WUKfMKLxtzy+dfJXn4l7vJhz+JuhIysTi7+cqrVW1YyMOWOWPEbo1ry
	3SVIjkEpCHza1P3Nx59dvBwfTHItTfdHBOZfCGid2Yi3IykxKBxfUHusav9diaQyvU4E=
X-Received: by 2002:a05:620a:46a9:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c9eb369787mr271756985a.11.1769776173119;
        Fri, 30 Jan 2026 04:29:33 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c9eb369787mr271751985a.11.1769776172555;
        Fri, 30 Jan 2026 04:29:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc6995sm406280566b.24.2026.01.30.04.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:29:31 -0800 (PST)
Message-ID: <0b628651-79ea-4ae1-8898-125beac7a2b7@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:29:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] i2c: qcom-geni: Store of_device_id data in
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
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-12-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-12-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMiBTYWx0ZWRfXzzyEuTx9tfXb
 3sYTSxijR6uE10fe2/us8euU2PbgFiE+JqWzvRR4+G7je8oQWQJun7scDBxDm9H4WbTm+zoaKIL
 s9shk5K+jxMIHL21/PwYvoRTjy5ULTTs4bCuwcUtD/iEN90jyTEEr9rifr+mIn5DXfrVa/twq0T
 rGJ+2OcRvAxanhmpva0hSQZfNuTN/h0iB6vciXk+KCAdf9dLGnDg1ZaKeE9MYJ0ZDlGQ9p0L2Lo
 lp+tcIjhfHmftBl5/UIGuQWjDuZwAWPYXm4RC9Cdc/wrV1X6uDB+BZWVUUl+qF6YlNyB8qgB7Lv
 Hfxykvlloc9rDvz3ERtVUlflZQo77rAF+Ao2aAQQfmd7DDkqRJ5wl/il1id01ERSxkyXOOgytSM
 OBjStXi8ecxDJFBwlCeaWRsqC/9uQqcU9TFP1FHwX9xpTzpzutzjlboiqAh0U9RrMgCMJyDF9K8
 BfUC78haogaEC1J2Gng==
X-Proofpoint-GUID: 4YC8iZgfYPYl6tgC2dqRNWnVsHsDQVJ_
X-Proofpoint-ORIG-GUID: 4YC8iZgfYPYl6tgC2dqRNWnVsHsDQVJ_
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697ca42e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GxAstmoraj778iUyJ78A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91307-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9977BA896
X-Rspamd-Action: no action

On 1/12/26 11:47 AM, Praveen Talari wrote:
> To avoid repeatedly fetching and checking platform data across various
> functions, store the struct of_device_id data directly in the i2c
> private structure. This change enhances code maintainability and reduces
> redundancy.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 32 ++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index b0a18e3d57d9..1c9356e13b97 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -77,6 +77,13 @@ enum geni_i2c_err_code {
>  #define XFER_TIMEOUT		HZ
>  #define RST_TIMEOUT		HZ
>  
> +struct geni_i2c_desc {
> +	bool has_core_clk;
> +	char *icc_ddr;

Again, this should be a NOP after patch 1, that we can drop

Konrad

