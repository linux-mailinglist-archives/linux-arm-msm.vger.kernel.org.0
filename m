Return-Path: <linux-arm-msm+bounces-98129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL29K9AguWkrrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:37:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2EE2A6F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C781300F58C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A80378D93;
	Tue, 17 Mar 2026 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqh7hmWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKt8sTMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497FE378D6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740051; cv=none; b=mIxE83XWLu4TUX0wbvJfNjqbs4UQJePY8w8oHkYutSMGutLOSeptCT9p2zsFvIEYvtaO0M7oRLtNts3CV9wb5x8oEMQ/CzITo8wFSue4qoqMRYLjYBc2mX7Km+9TawQFIroG3/xziW+gAFEvUCJLL0mINCtMIEwGYsG9x3l2nxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740051; c=relaxed/simple;
	bh=q11mXc44GeTNHTJOjLpEpeDqjyUuMZ4LYBQSqyUAaos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl1cBy9ZfSb3c3zlFaErDF7y/TOIiHPWTSaQfWCqupI7ktDbadl3Xg8YtpkNV4ir8nwjz7FeUEFrbRVOWCFpSngOLBcM6Y/XdLSSoYm7EDGD5K/c0TxX64fZqVjM0nc28oajxQRpJn/3pkOFptpz3XjQslzLLkWgX4J5z4LSZ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqh7hmWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKt8sTMB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H5ghWx1622547
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLwSasQd1rvijMirGAOReAB0beLoegkuZsudd5rMmPo=; b=Sqh7hmWjrqkgWcle
	fj8QRoMFPOxsLXUrSoNS6vpoZ5yNRcOay+8yfUd6mdzT01jsNCxY3rjLrEs1avbu
	i8djSf9m9DwKD8KQty52ICMKrW/oq8zJfVJEGRq9s2hUmS9ffl4sn7hHn5GEGmiK
	LR2bc0K5j2RwvlPfBHM3h5pCIjxm6wb4W7qHvQyvEBlkjIz4k7Lgmfj568Zg7Iy6
	iTPXncX3Cj0VAqS5eyPzbJ0imdFZRTslQvpTBELFkEtADfctVbpP6tc5VPwcaFrp
	dpyaiFncF0ssBD/RnIVI/QiDMjAeFGVMnkFwsIyzVzmKY/LjOlOCrrTk5698SZZz
	p7VISg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyeky7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:34:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7604c6a8so384597085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773740048; x=1774344848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLwSasQd1rvijMirGAOReAB0beLoegkuZsudd5rMmPo=;
        b=KKt8sTMB/1ojSaDX+D3LsSmjG4dhzrSP3+aEhqP2GUFO3y/x+9YgyJ1aBplJ6BqaVi
         JrUYDoHCahk56wpekY/dDpOHXjNoTthzIW2G67FRqRH1Q1sAZ2Gl88qWJb/vbmBi2QBf
         j6BXcO8w7gP77282osGuKiKB9qqg15s8w4D2+kOgneI1ZbzdhY/VAD3fyTV5CWvAOVFZ
         1NLt+y399i1iZfdNqwPR+XIOvsgQq3chVFHYXO6J7RCq4pMrZ1ZurNu8VEZ6Q7xuPjdq
         kel85vSLgv6yAaykJNSSAvKm9PDBdwvrweOhv/+4HMhaz4N8n5qp4vVhyCYzsQCQGRDY
         YeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773740048; x=1774344848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLwSasQd1rvijMirGAOReAB0beLoegkuZsudd5rMmPo=;
        b=E0KPumA3XeQRbyYU16kGO32fd0M430dleeFjP799URA0I4xegyXMneYO5dDH7lhM7x
         3sFPf+SO3SfuRaygRAIuhQIklea+acRHT20tmoO/HseuHBYgAlTjAt2Mb4Twm21EXgNw
         ATBInOVwwLslszIAXOf5KJ641Ggt6QyY9yu9RUqhu1Hw2gzc8MxjfEKELVH0EH5iQqd3
         Jwz9dQKAhjZQUREH7jBUahGJJjwOKoaAysNK2LqF0Ch740A9MIuCE8zZwyaILtoTVX7k
         1LJjr+wSdKiP8+BrYVMWVBwXthUaHxVrdbS4L4xjYxN3fvOzeSWh+ogdR7xxazYO8LHJ
         6VXA==
X-Forwarded-Encrypted: i=1; AJvYcCUSl4l4Wmn3xD7k4wLr/lD7WVSi1gCOqqGbt4DkF69HPuc5ZQGWL0b7gwSYfhEwNyi7E110kqxeyBGZfy0E@vger.kernel.org
X-Gm-Message-State: AOJu0YyjoDv7QEXcJFt3ERE9VYKQgo+A1zfazPRg9O9z3nNyYmrjiCMI
	c6MlCEa7ZgPMj2vFfN/b/HHYqgCSb0aRXHPO8IjKBIZ7W1G0x7Bv9HE4CTSpvV1v9HmRkAv+Z5J
	E9upZ/TRrTAJ1QGuIIEtnqCTiBwoLDopq8EG/JnUVMuKtrDrUo/yGvgD+3MJRRPebm0nM
X-Gm-Gg: ATEYQzzhYYW7TJbidCr7LpicKBPYD7dodrVDQsBl6JP/8QFpfRTkfdeCT6d9xjM2pwh
	2RDj6Ef4Zl71/wu0WzyHm4iHArwIJTH0L/8TbjrOZcpQEN9fg0o7vHD3pLvAQ+QNrze8BLFlHrd
	+d8id1GuWf9Rp9NQArH1m/WQjQaOc5TtL73l/K5Ta0RgRdUF3vJcLWPZtR1eXg5Lh9fgktPv1Ag
	3wqUoGFcsxQV+tHY1TcR1lSYoK8iw/VvNml2gZfc72xvwWylubelyied+K695Y/uk0H4XwqP1kq
	vajmuvpLBymRTKL1X6wgdF6269BxRBdJyxZAhSn9Q2SlVVhgiv6+/FewQbd3bV4ErP88IOiUZQG
	aAJ0HY2UPLmXO6yoUfpZm9XFUT7KaSBBdUR9r0+9z8T+oToNkRQ5SDwI7PoA6y/dtucX/Fi4RYd
	uz0aY=
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr1570593785a.2.1773740048538;
        Tue, 17 Mar 2026 02:34:08 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr1570591385a.2.1773740048003;
        Tue, 17 Mar 2026 02:34:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350b86008sm6324349a12.28.2026.03.17.02.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:34:07 -0700 (PDT)
Message-ID: <9048a55a-e6fe-4dee-8d37-7a998d93163a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:34:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sm8650: Fix xo clock supply of
 SD host controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
 <20260314023715.357512-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314023715.357512-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XwrrckvN1Xx64hFJm5m45sQ0thoDaTXL
X-Proofpoint-ORIG-GUID: XwrrckvN1Xx64hFJm5m45sQ0thoDaTXL
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b92011 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gMOla9jSct7F-4z9eBQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4NCBTYWx0ZWRfXxqqRwDE7Qqhr
 ttuOE+mCMvkTrC9VJ3zLEO9OhWOUFt6/zBK9xM24eWBNzbOGSPoJX5dDsqUthymT6NkWPZCVG5w
 kVwIHOoI0FsffALvi7SJH+J/RfZcv+h5asGzg/0Nffe/lHVn+aEglFFS9t1uClrTklCpqmH2cy9
 E9mlktGWq0clXpd73ePrVHy8LCnjtqgwz+frhucHvsbbAI8kmFecOQRPSAl+Rp37Am/PFJd6JfP
 7j5s4ksejkIYvMNnEX+44kqg2h49TnP9OISjcqiRIg5rNkBxeAt/NTdsF5HfE0Wh7/+sbNb8ws2
 ig63s7xxxsTkyw/yLnJPgeE6pSwT31JV6U+70YcZnjUU+3nOH1xc7MVZwzJ6DbJkvxqfSFv1sDo
 kn4XZPtaGOyK8co+aWfZo15VmC9BZpMnT0rZmw9zh7O8ys9FCah0sgfvi0R8BoPGZPtxiCxEpoD
 C3XwqLlPOJGKNdSxQ2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98129-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C2EE2A6F11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 3:37 AM, Vladimir Zapolskiy wrote:
> The expected frequency of SD host controller core supply clock is 19.2MHz,
> while RPMH_CXO_CLK clock frequency on SM8650 platform is 38.4MHz.
> 
> Apparently the overclocked supply clock could be good enough on some
> boards and even with the most of SD cards, however some low-end UHS-I
> SD cards in SDR104 mode of the host controller produce I/O errors in
> runtime, fortunately this problem is gone, if the "xo" clock frequency
> matches the expected 19.2MHz clock rate.
> 
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

