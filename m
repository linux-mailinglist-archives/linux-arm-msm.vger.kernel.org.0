Return-Path: <linux-arm-msm+bounces-95143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNgPOt3epmlkYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:15:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CFA1F0072
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68142305A219
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A970639098D;
	Tue,  3 Mar 2026 13:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3Mo5MBm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReEBn2yH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F67B347C6
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543556; cv=none; b=YmEcBtZj/cc0fJIa55sDMTOU1K57NWArid1VlaWgt7xpjCvq8TlbUiny3p/xnYyLhHkSF3GsyNONyp4T7j00O1KPseya7P5a7BFWg25UDmywZSPVcUJAJXrtmzQ/esVCrEmOKWvCXG20FVoo39siYlSeZqhA7WOGBwq3EdB+ZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543556; c=relaxed/simple;
	bh=DSr862Zq6qSUaB4c8S6C+4n0wnqrKg9cg9CtUARLHFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nd0m/AMpvgmyufARBz7ZcoOENyYQkGywUw526zLZ+FKFzgTFRTxqMPnZefGnMoAxnAg5hnkRltrcY6QPuJuIXzqLJjDBQdNAt7/scVrqaXx2FpNP8SjASPa9GHfKpCSAzmj0qMjN7Ak4uK2aEOMxijAgFUwT37P8BsclHhZSwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3Mo5MBm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReEBn2yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n7BC2630006
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBWI+40eaeQ+iw1M/4292kYBLJ2INezCodN+3KzKa+s=; b=P3Mo5MBmGfiAkfnl
	6WTNQqjOC0QdjinEsg8u6+pYd9sNN0zGGNi22hEaCzrmMm0CMlbYMMk+amaDVsqx
	JpvOC9R+zoekvYQ3gbG1U3nAUTzz8YPk340KBh/u4o/wtrz6XejctE3F6ETWrNVq
	JzMg8cFOCIArysS3n0Vfg+ECeXA7/AfISmwfzFYeeihVN4zu/Gk4pjkX77CL4xEp
	5xelraXsic8KDVrop79fzlXVZ6rICAaGlHFewAsZAKnRoBUchnumy/konkNNZApe
	PSv1a1Hr3JtVO3MrANMZkd2ZKQULBFA15uwWWYMFeCakz/Ktd2GLZ8jbgVvgTJX1
	M4S3mA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5awdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:12:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb485c686cso441674785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543554; x=1773148354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBWI+40eaeQ+iw1M/4292kYBLJ2INezCodN+3KzKa+s=;
        b=ReEBn2yHNdeQfaNEB9C85YZcR/bz24IQ4MoE+e9Rea6x2rnsyug13uAtY4IGHNCP1u
         C2ojyt5VjAAk7IejVMzOp5a5PXvbupIJI4XhKvia/IGZ/t5Q6imR0iA4Ceem2yP1b0Pv
         gNvKsTXuDB6egRf8fHdFqlTlWdtcVqgBkhPL0dU9EVlT3XT5ku8lo5shBFwQWlw9YVb+
         iSLfW3GTo3NsBAbK48I/0MW9NtpeULZ7Yn33QrJHzsRf/0eL0+OsKLlPiXDJTt7/PK99
         YlHNnnfMaZyM4F1YT0wpZslyi+smZD6DxLffiu3zoSjaL37OidER6b4jedAA3DjF/mgm
         X9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543554; x=1773148354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBWI+40eaeQ+iw1M/4292kYBLJ2INezCodN+3KzKa+s=;
        b=InlFHkQ6DrsPqFnBDx/YKJ0XyqPO+KwiTHr7PlXUyYP7VaZTAB0HhB4zgfZmoMXTHU
         g8TGdT+eDqSL8j5+CFvtQm4d1n6/9MvsAv5geoGh29ngv3mXURtakFSiV1j4UtXqz4ac
         FP3aT8jIrXNXb/z1DUw62ftA7y4wyjKNydbSADjxQvy7ZAs9PUfh3AUkRDZFmfvJ1je7
         QSm02Up3/7bzy/I/vlzY3/CGVi1YBjU6Y2fQsfPlKIerP7aY6lWkbJkYNWGwIN4gr5PV
         fmzqikMekVYdCk4mzIvFTqJGPQI6ndLOJ1roCNYKKuP50NtgeZM5BKrVUScYmWu5ximw
         GrwQ==
X-Gm-Message-State: AOJu0YyIHu4feGAlJj6TzTgqCUXcCQ7jaz7krNwH9jMGc3WLErwZcJjt
	RwXM1dJIbYtUGFG0UWKfohoF84+iHj+BtOVGjvc9Gd53mKgYK8appPhz4oNjiKuv/iHt1qfK93S
	wMXP0ONiah1mTnDAnNkNJEyTnSg4jt96TYCt/8kC5WJZlCRXrqMwRiqSYn2qlXSzEArb3
X-Gm-Gg: ATEYQzwC59uNivDOYMGPsgOL50z1krS9CTdbrWz4jX6nOtJ3gd/ov+4SIMT+IwltD4j
	82+UanyuKLGqkQQA6pZGX4i9VkmtFGRDvHCUn+Rh37fb0GH4TJuhai6wZOd2ThWmrevWe/I87J9
	pxJOK0HcXHCGdY2wwQoX6J4fEmA0SEBbKIinueeVtMv/8twnCF9k8ulMoDeGCeuONi/TJQQrNi5
	4ALRG0n0nK+dvptL1sjQFxJr7yuguWmMRZnwZL9kZtgJ6YqZwPSU9ImAcOlcoYeGynbwLShQr+v
	ACdQF99I9ay2+eOVfOssNS0BGiokh6Z3VoRpwoDxuKuCcvg+oeaz6DS+b+rvhbdktndxJgxLENA
	xbWo/1Z+bZo3ztmGXwN7bgYCqv7xsXlvuAqiJM006fA1hH23zkfPoP/bHNGVdA5dmPbCDA3tEYN
	0jWVk=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1582097085a.10.1772543554063;
        Tue, 03 Mar 2026 05:12:34 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1582091385a.10.1772543553473;
        Tue, 03 Mar 2026 05:12:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660b3aaf0ccsm374461a12.32.2026.03.03.05.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:12:32 -0800 (PST)
Message-ID: <4454f8f0-7be6-4e9d-857f-b484210a9359@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 14:12:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-6-814121dbb2bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-6-814121dbb2bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNCBTYWx0ZWRfXxdw9C/40umKY
 XBo+zvJN3hb/W9+kGSCGknVeOEQo5sKpZB1Q6pFRLPuP+COGM1cM9kQVHuyLfLuLnZ+r2TP+nma
 7V7N4f0PR3pB5sNdnxhVWNfKmVn68M1hjoxYRlMo59kD3gws1VqPFameaV/Jv+hNyjcVqbYyed1
 xzQgQIcVEa+L9w+RX0YCCZRE39Cu3yCfuhDFUM0Xq09w9231MABmyERUfxMVcfMzX0ROCpG3GXd
 UMJWZWXJUSMi5zR3KZzv+vM8wS2Y7SvjB4K/yrQCLrxj8jwvo157R3r9QlO1DA0FJWaP2KzEHU7
 M7eeba+Vz0umW+1UpV/cLRg4F3j8A+b/i8FQouxu5JxJbiDcOTUZyhBSQBwKV9eLsU2eCJwY2Rk
 8jwUxc+vNyQJxtCM61sq11waTwxM7P/5j2paVTsYx+fJKYrwWbo4NUd1ktm5aE5a2qVpzRnVIaW
 VpTZi/cPp4NvjOwJjYA==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6de42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mbR53VIhkaFObWXl9GwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: m_Y9ouLJeQasvyKuGASuMGUTiwPeuTIP
X-Proofpoint-ORIG-GUID: m_Y9ouLJeQasvyKuGASuMGUTiwPeuTIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030104
X-Rspamd-Queue-Id: 79CFA1F0072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95143-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 2:07 PM, Krzysztof Kozlowski wrote:
> Add entry to OF table for matching the Eliza SoC, using same
> configuration as SM8550.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Eliza is UBWC5.0, unlike 4.x on 8550

Konrad

