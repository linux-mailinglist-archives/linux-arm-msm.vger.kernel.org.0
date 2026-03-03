Return-Path: <linux-arm-msm+bounces-95107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPTJCG+7pmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:43:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F871ECE21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60916301C5B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F7939D6D0;
	Tue,  3 Mar 2026 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtJtOGVf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7lvWPsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF6439E6E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534633; cv=none; b=mBO68+zWEMOi1c/c20l1atGwyR3jHH57PY1AcWbYOyu3tRT9hqFBoY+9xl8GpuVpFF4a3RV8Nse0YeM6NV6m81OBYKgGb5WvKDEQPmKHXF6g4Z0A2y+zDEtVhAuDaSmlGHbjECuO9hgQeiLiGAxJvlYnOrV/pT+kC+NngPf/fRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534633; c=relaxed/simple;
	bh=siapKVSE/S3vs4PHnP9yQG3Bkp9vHFc0BHCat//8mAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmF+jPkHDVC/zl4HDE2XrYshCdUArrHqj1qzodQAw3Y0idaPD3UGKdCf8UXtPr2AaoqFGnyfsWI65XtLgOAsvfgwqlQBndVJDa/u+ejp18quH508pl95m/DvBaQt1sqNJf+/PiijELmU4ya5Kkh7qKR6FGoH6f9cVpdx29+umfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtJtOGVf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7lvWPsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n84o2630039
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5pfyuRWSZFKBUiCvDoDVhH2vGDOGKztJzoBqTTWi+JA=; b=YtJtOGVf9NOoHI3W
	68StTHpt1KJ7+GakFnnal65V/g91MVJ/aCgCVqM+EkhrvF/q3jVNd8Hy1AUCQC2M
	hGPRFxCQfQYVkBU3i+dOC63f9HNYBRTltipzF5KAvJ+B5Uc9bIQHMeE/TuGB8Xms
	nZ7E1RfKBdUzRZPA6ZwOmX2uGekHf/IfxwGDZFfI9UqAeUp1M/XNyBAUEeDBoOC0
	eM4dgbge7DlFk3L9NWCuaG4sAecyoNub5/c57g0CLTb42bRlNcgdv4/b1qssOmyI
	+97/+DQ2MmJgoPmyJA2zs8aITBcliAQ/6w41y/65eJrAJr8pm33xCvqYWuXm9BVn
	jYqxjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5ag7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:43:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so487587285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534629; x=1773139429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pfyuRWSZFKBUiCvDoDVhH2vGDOGKztJzoBqTTWi+JA=;
        b=Z7lvWPspudO2fiaLRws5SzEShZb4TP9TxWQbB+kX9ULjwVub99041TqVi9pT/GFczi
         stzvcm6kZJKnp5Rf6g/WRO/uwW3pkjdTJyu2OwB+elnt/tP+GtwpxIq8cjEuCcjwQLUc
         iTqBDb/5s5icf5vtKLWCdcSlewm/iDBVcEWih7ZBjI8E0cTCh3hB/j1Sz9knyNo4y19f
         ZG57nGySTDBXMqr8BZszbsaDDUMmNVhlysSI3SnFZrIfLbybBm5NEl0nR7pyEpBaf2/s
         J7+2YtV1MK2RTDCOFxbC9Iqg35ki/P2ZSeAwPrOrdPa/XHmEY9ZvKtTJSooowH7KWiNf
         6xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534629; x=1773139429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pfyuRWSZFKBUiCvDoDVhH2vGDOGKztJzoBqTTWi+JA=;
        b=I+AtibGQGPzemxz1PxzvHwemrCYvENs17OVTM0xBQOcgu9en6kaSMjtDw+amD7HLy8
         ORLiVov2/bMFpL0AP+LGQwYAqpLLSITHvrGXXMYwbOV8dlp075aRzj6rMvEoLWHyo17e
         +uMuLtoym4wD8+2qpHohogOsPDg1Zu4D26lnt/fupN+OCM2NjejhUK25sPg3x0/+bcJX
         +w1Ak3GcjD2gSm8Hm8lrImmBMv+Mx9rBeQRjTs4Hnqh3Lfs2EaoMKj64lrpbwpbNjDM2
         cseAAaGRAHNL8t1ppwwT3TnLbZHPhiICZGFojMd0mjLxL3EhZdeqHVGC/LCt4Q8VtDcF
         10ig==
X-Forwarded-Encrypted: i=1; AJvYcCW6LVOk6XSRw9EljLeGgJa1QKeN/oCsi0FJqT0JIIW9QTZ1TPbl0H5BpZ8vWypQtySjTNdM4japzXHvR3SL@vger.kernel.org
X-Gm-Message-State: AOJu0YymGfYmAxIPbxgXLrfQDk6zyoj39N0suJ957nT6/dhP8OkPNFzs
	UbXzZfIWmaIkvneFzvb02d9acT2iTjDiGhReTsVl2rH+AaF5A1zoXVeG4HJ2G5749dmqvMFqu43
	3yRNHfumiw72XLqvcmAWDdLOTcUirDTbAP1bTL6iFbWBwf6VCchPUdeCJf4jDnBTNgNoL
X-Gm-Gg: ATEYQzx5e80Mk5zBf2uwwHLfVY7kJFruuesAlsJKYfZS3Fk7tMPSIhDcaTVR8vaGZfe
	onr3pztS1+cK+YTldy2LS48NBQiHu6hQNWSpe8B4A8avJhcttvx5Smt4Ieb3F8UdDeVeTgcC/Mz
	gRQ9OMRbSOblEBxk+/4yjKzZyq5ya56dj1mPSn9TnFCTArJbOcVGsJVm1EeiB+X6cENXQIid+yX
	MDeIPqfkD7b7GMJggzzYkgMmac0TuqKOCdw3HTlfRE3v+gaR7dOjmm+5RDYbAwnCS2cVzluB86G
	HsaWnf4bbrqp33uKMRljNpvBuQMNPL4xlQEqtaFRDwf6QOdcovJBuSP0y6Fm6iQyC1p5sMA4p3v
	IRz+y8QIbqRcM5Tv+fjV0iAZQQHXuETJZ/w95CvfRowfRrPT+PLCoFMe3bo/OL0u4og4q/tP6I1
	p2g2M=
X-Received: by 2002:a05:620a:7014:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cbc8ef4245mr1455757585a.5.1772534628584;
        Tue, 03 Mar 2026 02:43:48 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8cbc8ef4245mr1455756185a.5.1772534628089;
        Tue, 03 Mar 2026 02:43:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac07b7c2sm4121165a12.31.2026.03.03.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:43:47 -0800 (PST)
Message-ID: <9c4ac0a3-544f-4dd8-b3ee-26a40a817e85@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 2/3] arm64: dts: qcom: glymur: Add USB related
 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
 <20260302-dts-qcom-glymur-add-usb-support-v3-2-883eb2691a0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302-dts-qcom-glymur-add-usb-support-v3-2-883eb2691a0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MSBTYWx0ZWRfX4eRHMNowU65S
 On+9ngpRVbDbjIdAe8o1SDGcmwj7+5UninwfJVQgGPVypfbQmRZNpKW1k6c2itlveA+aX5R+Yqv
 n91y+TMsoSfpyTu6eYyDqG1IP+V7xgqIy2x1CnIz/ljbmRJo57w9f8qM9aOYpliOGS9E3974T8H
 fke49J5PQMq0YEnoNMQ9QLIXWHrkAvDcZCPDVAaFxFraIe13HbLcPttXtmYWYr2NgmRRJX2jGMT
 2t64eAVH/MX131KzlZ4ql4df0y1BwCC/cseqxC0P6CcDaD2Kk75LCrgioGeT6J6FtrY8QgIuyYz
 pwlzeHkjPy/xiMEQL9LFRyFbbQaSV6PcnQ34UnfA7KfpjnjVapSjeacVDvQg1IXJVxUkjgVJVmM
 ngpW4Tkt5WWuzEzxMUQPR66TSI7hWFliv5C/9FSTiOivx/9d0eqopwYqpEzP+QoemUl8BCGxje4
 IkoYcPceHYNkQBEPhvA==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6bb65 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o_jz2lA9kCOULBL2u_AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: M8Z8MxTU7w35tvCOjtXNv-3V2KLIHy0M
X-Proofpoint-ORIG-GUID: M8Z8MxTU7w35tvCOjtXNv-3V2KLIHy0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030081
X-Rspamd-Queue-Id: 28F871ECE21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95107-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 6:09 PM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

