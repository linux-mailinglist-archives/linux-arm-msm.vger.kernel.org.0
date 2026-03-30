Return-Path: <linux-arm-msm+bounces-100732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPmDICxKymkQ7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:02:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E0358C7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02AE2300EFA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A571339B1;
	Mon, 30 Mar 2026 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7TrfrOc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaM28+17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9752DCF7D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864560; cv=none; b=EKuGO8Ee4Yex7lA+l9vcS9L9neenN6utCCDodw8iIyZ+CVXNW8BmML4q+lHhBpzZIVmpCi7D+whtL1Ad3D9dkMibmr/UjYz326SIJpRE9uAw8/Q13HPCE4UqqV2CVkbvilYQjGHYk2TTMIoT6LQkkVCNBSTAaHfbNMIzPDnP5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864560; c=relaxed/simple;
	bh=zChUuesQPPZ9Cnt7BEFeTnXGNo0HHH7PtLm790I6UHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+8Ael81MjgwXtH8tNgb5uJu2Gp2H0obP4RhaJBE5RmoOWtM375OzW3Zf2DCC8FXF338dVZQzz+EsHb+9W+JBEoj0LqNMJ1RHx0QAbHrvlktOSUvWgoYNgi19dSfopY2GYxaev6q/7ANODiZ7Lduju/Pgy1mUueeX++vUsBY+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7TrfrOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaM28+17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8Pwjc2458297
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Teg2kjJs2++27wL+k0/VJSnuNqL33lQ5+jphN52LdQw=; b=N7TrfrOcqlxzG0mu
	AmYq6rvIioRQ+E6RYjrOAHN6xc/rqAwUKrkFgHBUY1pFv6UFWCITRQWkYg4ZGHg5
	MUiwpf70jdqLNpjsWyOVQEvIouqLPRk9PDYsfbUrTovxQbhA6i+xt3OIBVCObTYW
	FTsHvgB8J0XtLZC2X5ZzZiivCdqZJzQ9T/EFECAFwR4f1wddTRxaANiQoywYa1Cl
	N7/VSGR5GGyScdLnpku2gjvmGCpFn4M9uLhJxGOoGWiBMAHemHanSWU1Kmd2Bhch
	5W5h5R3NhjrAeENJJjNEYDeOiEbWoommKyPvXbOazsBgxJoxgQyv8nQBZRiybG3B
	4F4x+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmrccv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:55:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfbd336c3eso166918485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864558; x=1775469358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Teg2kjJs2++27wL+k0/VJSnuNqL33lQ5+jphN52LdQw=;
        b=LaM28+17/ywDqfuplSn6BL762LN0tMlVKE5IVCBLlEQs7vcYPvTXYmnIxeYWWGSKIT
         OZm7haRLopdh5NmykdKR4nkHu6O6pVC3jWFxSa8gj+xZQ5b8upQ9DytbGBqDrbbywnYQ
         vaxtN54UtqUd1PHgpH18ZsGu13KNaHwzVwBls/fO0G4OWJ0epVdjK2ImnQPPb+aftrw5
         hY8kAM3n8UZiwOOeVAvVqd+mY5llcErd/vmb06feR89QapXmiTi3gNQ0nnKR9lv3S9v1
         ZjcTVL9veaujm9wK5h0dtAY0jdnod43saw8m+1H1o+S6vO9m61b/Oxqb74DONdRlMrma
         OB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864558; x=1775469358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Teg2kjJs2++27wL+k0/VJSnuNqL33lQ5+jphN52LdQw=;
        b=ZMd+zN90jDYUvjqg8aE6L3mRHRVLNebRluD1W2zB8PnY1Wto7/3+P4l9H410qh3qEq
         OtseNLfrU3lbp6wQ+SN8P1q+CKF/1QLv3aPVhiQMFziQ6SdjuSN0k9fwnT5R2SZEH7Y5
         kUKqUYDSum0mZ/fkx4Gde52XjX6HTUWkVnB3n0NiynuBm645YoQJ4wbmFl3QqC6wkEBx
         XVSZ+uPg2+xdTscVe3aQG+ROw7gxR+VYwLbN08SFhOCop4lnCgzIKE5B94oHlFhBsRBy
         P2ToB5Bm50RasS7WrkTGfg6oKh7h475WpvjGd3azCqvQTjRDLEJrIeT983GQ3Dbs4c1r
         8YTw==
X-Forwarded-Encrypted: i=1; AJvYcCVY8OgqqyOTH/jQiJfQvfLcQT4A9DFXvFPuLjtr3+HYu5xdYpo61QNJsvK4dy7+8zUVxikdu02LjSUmtdlE@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXU6aH+gDoa/xD9hdt0IICkvTMpN3+5IzKxbASUVjlkbZ8u+p
	tIpy6kqdmOW4Yo4CazCpn2h9oSPavM7EICGg/bfh7p1o4tMWlChdx4NM/pwUmVn0VhHjujx3hvh
	r6TKQLWkU/CCkDfVGKm5AcX62dC4k3ErWnDi1HQelEKPjZZJEJd9U+LRq821dIi8iYX7x
X-Gm-Gg: ATEYQzxO4+W+R6Xf+3ehlh6S/nEbEP2M9qXMw6V9DDq2APwBvLsraZ53tKwAtNAVUJf
	+QzkI1iRnUwTVTUhRhaG5rG5ifkzQFzmuFY5FHCtaXrju4Vc1wWJgpXGJzo9c2WOVtS970sD3I3
	e1l7zoEOXkH4cAeXd9N7nG3OwZXxYv/5EAwLfVnf3ES7/Zu8P0OJTXDVHHo3t/qydVHDXjg/HZE
	yRQmmzSCHdqKGR9bfOS9qyUMRArshtqlUJR5+EjgsaOECusf1xjjbfXnhpncOe1gH9UxhkxTEjQ
	b6J0L37Nnfhe9Ho7MCbewhev4BN99nGWlmyyecftWJIyLkgaqrvkxRI1nhn8rxdaLsR22M5jEs1
	0UWruA7I7aor+A/Dj/JBOtDoGyCvF6te5qIUJEctPO6hKhHRTcnIzweTgVFDCeBdaD181QtrQ8h
	fOq1U=
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr116889081cf.8.1774864557944;
        Mon, 30 Mar 2026 02:55:57 -0700 (PDT)
X-Received: by 2002:ac8:574b:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50ba39f670dmr116888971cf.8.1774864557560;
        Mon, 30 Mar 2026 02:55:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae256bbsm265895766b.3.2026.03.30.02.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:55:56 -0700 (PDT)
Message-ID: <2edf563e-ee32-4ecc-b912-d0a19b8e5d67@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:55:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: milos: Add display (MDSS)
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
 <20260327-milos-mdss-v2-9-bc586683f5ca@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-milos-mdss-v2-9-bc586683f5ca@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX2B0leXwX+HcN
 lkh4dwsjGpOgG8kj9l7h+3DORZaHHTZPcji5EJjFJkrg78/YOCvtOIDNIMVEr34A4Mr4OlENiBT
 5ujlduKOFbnz+SS9ussiqRu8Re3l7HBXZUlUeC/IQ/ZsQpjSri318y5CHuvcbL68AQME+COHyua
 KjjQrjW8ZxzZ0kmJzgcFDq6XI0MWBKf6hbB86ynvjs6r8hViAedUdAsQo3ISKFfU11oum7cVAUQ
 LwIsBeFHM15H5XlFUHNsNxLxSJy04+DkHEvYQ2gsIbopZamrYIQW0RumbPv14viPMNx89T4cVpa
 ZytPzXV6Wv/TzodBvd2U/H7d9EjYu86BLR3ZK2v3SH7LHVgpFdqwUWRKZW+VR4rc+wSBoSSjzt6
 Q06xn/mdGuMc9FNxcENNisv5UYoZPpusf+0NhA2m3UvSRR1C1cA7Qobb5FPQPXFfQxa9o9/Cwrz
 /Aye+c5wAscQHDGBqlQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca48ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 95NHr_SSMBMOu8wuNKKbQXSYbT90CJFR
X-Proofpoint-ORIG-GUID: 95NHr_SSMBMOu8wuNKKbQXSYbT90CJFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100732-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 0B5E0358C7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 5:12 PM, Luca Weiss wrote:
> Add device nodes for display: MDSS, DPU, DSI and DSI PHY.
> 
> DisplayPort is not added for now.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

