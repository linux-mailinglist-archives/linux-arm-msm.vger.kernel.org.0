Return-Path: <linux-arm-msm+bounces-95119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KU5JY3PpmntWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:09:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA61EF115
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 388513136CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DD042E01A;
	Tue,  3 Mar 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NB3qVClL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzaBW0Tm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7EB42317A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537359; cv=none; b=LxzWrlNe2taChufQXVBDMPfM2H1VBt3AvtRLRPGSsAr3uKYALyWFwg8U/Wwm/UKopCP9oMdmj7zvXOI3buObDyleJQ3yrvw2rviqqAb/4ggQwAWKojihmjJL3uNpjVvlpbvTVb4g7An5dcjr+OIX3QgH/5jomuJw2UdpHmZo15I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537359; c=relaxed/simple;
	bh=G/3Z1K53rJdl/TCaHbhKbvp1KXy3z+FehumKhtCp4MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njESU1/A9xwlwSf5Q2oOcmcPwweoI4tNRxRQYtqVSZb3QyaCpx/CA0/gLXr9cOfRhb5I/AOE9SbxdNsX+Pu2IDKYFM/2UdubMCJ4t7Sd2cezZtHYmkNN91XszxwB6XOJVZ+A/V99DUhYEymmdT/NvCPUkImQjXFDs/P/tga9J/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NB3qVClL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzaBW0Tm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mdDx2307408
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7E528mXcuIMjIjKLIeGUqT6KwWcbjhsuWdJSyllS510=; b=NB3qVClLBh/5OQx/
	VhoKZkWFngmDF5QepvIF5oIP3YIhKK2x0e/+hF1lpZga9yWGZATzPEaGim+o4Viq
	3rKGDdVFR37QGrm7crCKdnA9DavoBWjibYRUfitsOdkQhJ1iAwyaQFOx8tfDPyR1
	3zlljsYt5VKz9WcAyXAWKlcG4GExKKBSUcu+6a522z4PVzO3z5u4uhHklgyIe+hZ
	633wdP86WSsz7LHUy/knHUQYZjUgeLY8ogI5wQN9UWCXz0JwYEonCriRtTe/LgiK
	fUU0N1A1yWICeBgUHDnnWBgqAMDV3awZyaaZBJ2dj4WaR4MT/4aDlpwH/5W7z45I
	HGXQow==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8dt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:29:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a0100410fso7150296d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772537355; x=1773142155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7E528mXcuIMjIjKLIeGUqT6KwWcbjhsuWdJSyllS510=;
        b=RzaBW0TmqRGVns1t1wMTxWVbafkVE8pFQT8mhCAAlU8/SjInVrpBblKGAFH2/mV4Qn
         t9/xPOQbqCrEJXkWSodUCpAfEqQRCsHVDiBDIHsy7/27tr88Ar73nh/od2s2fFREaXGu
         ++0pbke7mI4yyi0wd0dTIULsyQtwZdTLXszfKnxmrWS9T/p7MiI+G1+v6K6vE5smIMg8
         aRcW3ZWkm+Q94ARGEJY3tK20FmElY7djIKduOkGM19LBHhPtGbQ4N00eaQTtf0q5CRgE
         7Vr+r/HnTgSDbGjIdruAvtmv8Z/dJ9gGMPO4KEfCT+6d0wxAR181Neh93Sk/QY3S7+hk
         CYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537355; x=1773142155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7E528mXcuIMjIjKLIeGUqT6KwWcbjhsuWdJSyllS510=;
        b=RGZfKAvKNtNNqYwGdbFJMqILr/wylFOpuNmOKUSC73G5yg68w8sgOIXnQ/xU9QuKX6
         gFY+/MZUYU99rz9QEu+wh0Jp6jU3C6lpiMC8UiDaIZsFmHVVycQVMrUQemRO+rCY9vA1
         a5qHX1A0+HJP4Z8hhCjqJLhHRzrrJ7VoHa9bsCOpTyYhpTo02k0Yq65GVsoWnVO0++c4
         ugPTKCNb45f2PvJ6yB8PcbD2EkKWSm9dPrGMqHPMTS24DAiQXKiWQgNaTqJRsyo7/HT4
         VO5UERkAuCuq+deth6IaqLddGJ298ihea6pgXgFttesWpfjWtMDA3NAa4YH80g8CgFaC
         BHIw==
X-Forwarded-Encrypted: i=1; AJvYcCUvydilwPi6h959+vfoa/A1n/i8OawLWr8etLc23ogeEuKZeai4W4mfkt9Nfw6eVFQvHW4pql5QbLPMMbl5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0sDXRkfDckzzyG0U+lPRVsNPut6GG5vdlUs7guXDrfkjkMTQ
	rNdvtip+aPT+tzUb16TGw2m9PfF3w3A3CC3YRGtWVe23TlTn0SB40rgFDFhO3EJafxQ42Te9cCO
	MdmlMOriiEW7A1Z47nG7DkYape8j8R1Sin19znxEZO3Y2anzheHIh2TjiTEr6l8g3TYsv
X-Gm-Gg: ATEYQzzW433UbhydTEPW3jClGgJC1ULWSJtAa7y+Z6Dx7JfDlloTNJLQqykSY9/ApC9
	Hy9S7RCOp3WOLwROWyZxmQkyZah3AlhXJoyPXd5fObnP77FMDytnwzmyNBVRM1mgQpZSNuhDced
	CJ0JNt7cys8t4X5/0pEY642sORvc4wjKCZnybxWN1y12sEjHiuwAMkK5PfVIzy9HDAyziY5Pe5N
	sVOmEaCBvKH48+HLLE2XlFn9d0jw1A6FUgX63wJrGXHr491WN+3ZhFD6FWw4Pr+vJDRXc3h5JdZ
	ZUw3+5AZjmxkkTHs6Fhwni2iYuq5f9EQKW17Lzb2O9lbHv3W/psUzYrDA0DyII3RYtIcMOj3XcL
	HqpMaUm2ELXIuNTiySXaGZilMllTcG+fTmAmi2ttF78rIfjx+tQncsy4cff7jMXQoJx6zwEKRxr
	5faRI=
X-Received: by 2002:a05:6214:8004:b0:89a:ebe:1cbe with SMTP id 6a1803df08f44-89a0ebe1dd1mr9127306d6.8.1772537354829;
        Tue, 03 Mar 2026 03:29:14 -0800 (PST)
X-Received: by 2002:a05:6214:8004:b0:89a:ebe:1cbe with SMTP id 6a1803df08f44-89a0ebe1dd1mr9127086d6.8.1772537354344;
        Tue, 03 Mar 2026 03:29:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51431sm583174966b.17.2026.03.03.03.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:29:13 -0800 (PST)
Message-ID: <a0dfe279-d4b1-4b62-b312-03f1085727fe@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 12:29:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 1/2] arm64: dts: qcom: glymur: Describe display
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
References: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
 <20260303-dts-qcom-glymur-crd-add-edp-v3-1-4d1ffcb1d9f6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303-dts-qcom-glymur-crd-add-edp-v3-1-4d1ffcb1d9f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1qTIicBLtzLBmqtarbQh5ePf8vKnh_qy
X-Proofpoint-ORIG-GUID: 1qTIicBLtzLBmqtarbQh5ePf8vKnh_qy
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6c60b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jFGaBxfI13gd1SiwFQsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4OCBTYWx0ZWRfXxqWhQ+kodWFP
 kHFgRVSTsMeYz48lTb7IUecN3szAJiztpniRuxZdXvfQWyT2Xxuf9OduRFmkI2B9QGJ8QTwWHQn
 +IlY1wmCdMiDopWxNcd6NBozGdZucqBY3olJdDdqBI2fWz+tGxfeq156B3hQoJ4rItzSfuaJvLp
 XFYoDzS21X/Rf0jsnXU6hqrnkj++3wTf3MaR8iqAk7JAoLS0wJAhJgZfLAMAWSGn9xrDFy4MAeZ
 ejaHwPOI/CsAa18g+0L6YzD/V0Bgr3UPBztn1q97o9uEu/W7RN/RuPkaH26c35EQSHzvQIfzmKN
 bkv47VqoiQSwQtDS97ALIH2E5Shqe7RJSFYa8bgb35V8RPYUKh4vnMG1IIwPJUqE9toNtc6EMtC
 6qfpgkV3ApSFSgiAs9N4m6PxJw1Di4Ape8/Kkc2UHhgpG9OnJopddCRqS9XJ0+KbbbD75gZVbTV
 YuSnJ6FkJuJS3mXjP8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030088
X-Rspamd-Queue-Id: BDAA61EF115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95119-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 11:44 AM, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
> controllers. Describe them along with display controller and the eDP
> PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
> clock controller and link up the PHYs and DP endpoints in the graph.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

