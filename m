Return-Path: <linux-arm-msm+bounces-96641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJB8OuIlsGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:08:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037025161C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB7E93388574
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0553EFD0D;
	Tue, 10 Mar 2026 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMsd1hnX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnRLlfRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D43E92AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147020; cv=none; b=g8RNAWtNjI7xVn33/8Ytgzbb7pTArLmML0otid2ebV9FZqlzsA0fUNprCLye+7ftjPuoK5ToKol9VPyDEAol5sKZRW4YWguJMXMOTRDPHqbLWbhJPTWCx2gx6bD9VA0QFTRCSs0iUba67hCO+f5Nt8AJ8VDe3tMMSs1f3QDd3cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147020; c=relaxed/simple;
	bh=lQXom7tqTXB8fIq42X+a5CDIzvyVk/isD1p5TN9jIOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjjIXUT6KBD9POT5MDI+iC5nXE1ddnOPzvAreu3Q3b1ss09Hvr42AX6E6aOF/2IulsR1tuJHRCpVi8PrcriThds663ChRsZzd14aszrFUYnO8l/UtTJy7JJfog7Frn/32F3JucUBAPcpobgNU/JeqMfJdBt2QiKEXQhzVud2AsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMsd1hnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnRLlfRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaSAL024063
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IG8LtXmT+b8gpcKphPQcoqVpJ8lTrFw7AVmS1IYqskE=; b=FMsd1hnXG9jcZy0O
	Bcx8VGxTcQQSibgbXuGm35AoTMP0a0lAxOj1lnrZo7pFfp+1NsS8XK5WJbaSqyVr
	oftHJJFwz/MLjnBK8urZvRMmcfLy5seFPB7dckTWIA3nyQAMGeESUPWZ/AaEv4Ba
	s1RaH+4mxZwABIZzczN5k5MND9v1Z5zCew6OQSyUj7Seo2hW5EBpOpYb9AqWkbs3
	JjDQ/El4dgGQQk+QqNjLRgxCtqreknag6XmHlK0o+fYYjDdz3jnblUdG5i/WIqtN
	Y84ntuHVlD1sMkJpV6g1Nsk4DoA4SLsEN6mBYdjvmPsPkBNvvQDma657Ybg/zp8Q
	QL+HcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngwmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:50:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fcb63705so45816206d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147017; x=1773751817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IG8LtXmT+b8gpcKphPQcoqVpJ8lTrFw7AVmS1IYqskE=;
        b=ZnRLlfRQ6BJy0A9C1/eEauON5tBTDsxTAnrKhlZso+w2rZHb5KGhPyYQG77A/ssD87
         RHTJe6hvXuOTVKpMPA8O87RjOwTxee8ahObXJa5yQimMrlr1O/gdZLOwxTWlRoWPXjIO
         werZFhW3yC2qd9r64OOO2iOGdmYce57IRGQO70rVFpnzrHa+KAeD2Q4wKbGdcw6Eo2oT
         OQgbHF9ZQmL8mdrLSlxPE6zwx0Xz6l95haIyroTY4zKfhK82DhsJDZq7YmmgAdSrcuxy
         dReCiP6LQf9DvRsthDntRmKMplwR6rRXK3ib6BAAM8V4ISM5pBBvQAT8OHTy6flSBtSe
         4WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147017; x=1773751817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IG8LtXmT+b8gpcKphPQcoqVpJ8lTrFw7AVmS1IYqskE=;
        b=FzYgHcq/3b+DG3D4v5LFLOC0VCOU3etVmPthltNSu5cG36czZ9hWRavkDqZyFr94iG
         zZH3C2dSNCeCQU5kTlK07UcTcO8P79mVL4gHXRrDQ+7S4eEI7kHnLBL1uwsdF4wwiShk
         UdTAJ+M4eY5fo66kSkKLlyRZDHbtgLwJdKPno7nf6Duf1Qx3+3k6uSlToxWP3pTRd88U
         bC3Kh7k5QQFPszj1qFAQPkIvkOTo4J0SkEepcqrpU6k75wkZBlTLTrTvdoS28/q0yTTd
         HyTlOLY2FnrLRGYYQzncAX/BTyA5p9hOk1YxegUDfH4Ep7pvWnmrQz1X+9OgBYqpT+/W
         CzPg==
X-Gm-Message-State: AOJu0YypZ/vZFBCz6GHHSkytlzvtE5pC1h3HMMx+7Ga1w1MaxXIFOuTS
	QD6/pReCAI7OajGjLaPmMZs0JNGdrM9cwBVNV5B1KdqVIl79fJEED+Pghvc6dTmieWfRczyk/ar
	TG9DTTdSji/WolO9ozt0hZ6E9+t8hhANXUkzP9+vHLfbNKXxc49KHVFBuglxHc54P/O/0
X-Gm-Gg: ATEYQzwYjY58v8XG8T3YM0NCnwPGe5zHuDpyU3kHSxo00W0OWzQOksMVqKnD4UCbbVj
	671R5Y4JOW8Ebzl/q8nMPIdpDQYKZoVLM84tbIQjrLIfJnOjXmLLlQXExIdbc5yDKbrCymMUXFs
	0QVqWwQGt9MalPbxSbpME6jc8yKAkQHCSgTJ9Fce2GiFYXBN3pc/RBPNCBKWHPpuJwMvCxRWLxO
	tJX59zhcS8HwcjTACeskPWFrLRYXiuHwxGG254/TYyu5s0oMsDKFglUF5r2kObmRrgG4IWfQ+rn
	VxaYF6KUeGQBHYNevw9YACUSYePCeNg0u7D23FFdQdQ3T14ag2FDLOakHAL+pL/pF6tC6OBd2Vu
	BGHbr5HoowtWpfou5LVYaJ7fBcMnvMApNHeykL2Bs1MS8nZMakL/VjHqmdnG/qZxvEwwiA4/eWp
	ZpLJw=
X-Received: by 2002:a05:6214:8088:b0:89a:5129:510f with SMTP id 6a1803df08f44-89a5129550cmr61342376d6.0.1773147017552;
        Tue, 10 Mar 2026 05:50:17 -0700 (PDT)
X-Received: by 2002:a05:6214:8088:b0:89a:5129:510f with SMTP id 6a1803df08f44-89a5129550cmr61341866d6.0.1773147017048;
        Tue, 10 Mar 2026 05:50:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e3dsm478595666b.36.2026.03.10.05.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:50:15 -0700 (PDT)
Message-ID: <df807d03-8bcc-4456-9b71-c0ea7928370e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:50:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] drm/msm/mdss: correct UBWC programming sequences
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 36_XzJdfJ1O5ftSAE1sMs86gaVMA6Fhv
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69b0138a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=g9AtgMIdhz7_Ts0mvgYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 36_XzJdfJ1O5ftSAE1sMs86gaVMA6Fhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfX7j7C5FcD72AP
 K6n6zG5tUpE9HEWL0KPzuONZSI1bjY8OE1r2F798gpw0vBeKSJinu8Mqc2OS8DWBhGPTxNRPlUT
 1pOhTN7H00hph5vR43KIHviGrlYw+GEZ+fFhixTZDq4gKj6oiMGrLqfu9xeQieRx+8VVZP6IqBl
 C7jLRpsw82jMMkvyK3UeUcJjxn+aklmJAwuDgrL1lGZPtIYFyvslpX9UFgFWsEssN6yWvkP+TIK
 vUu4tDd5YUzk5XWlXhOddn7/V4mu4kZ1WrchQdc+p/5DMOX2M8tJhw0mF84Sox+LszIxTNRgl/L
 /lp1rUqvx/ccmq5tB0NhwIbhYs+fq3xMxznGwZtnldee/AOyveIW/yeEUbRhiISmKYe91DD6P/z
 ZHkuzMM95OEO/OAazp1Vl4Y0y2+HwIvzJtAZIrU6SqjGnq15IlS5Fy7hR60U8WH5f//WReE/VyK
 WNfTMaiitTKLR6RsCLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100112
X-Rspamd-Queue-Id: 7037025161C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96641-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> The UBWC registers in the MDSS region are not dependent on the UBWC
> version (it is an invalid assumption we inherited from the vendor SDE
> driver). Instead they are dependent only on the MDSS core revision.
> 
> Rework UBWC programming to follow MDSS revision and to use required (aka
> encoder) UBWC version instead of the ubwc_dec_version.
> 
> Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +	if (data->ubwc_enc_version >= UBWC_6_0)
> +		ver = 5;
> +	else if (data->ubwc_enc_version >= UBWC_5_0)
> +		ver = 4;
> +	else if (data->ubwc_enc_version >= UBWC_4_3)
> +		ver = 3;
> +	else if (data->ubwc_enc_version >= UBWC_4_0)
> +		ver = 2;
> +	else if (data->ubwc_enc_version >= UBWC_3_0)
> +		ver = 1;
> +	else /* UBWC 1.0 and 2.0 */
> +		ver = 0;

You forgot(?) to use qcom_ubwc_version_tag() later

Konrad

