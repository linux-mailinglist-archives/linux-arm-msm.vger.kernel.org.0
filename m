Return-Path: <linux-arm-msm+bounces-99560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ8bA2UlwmlOZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:47:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C330269A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C481F3059375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 05:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579253A3E8B;
	Tue, 24 Mar 2026 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHBgmBlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erSA+aSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA753A452B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331176; cv=none; b=nYR1f6UYeKDSU1MFq4SC6J09QgvgWYbj3flvsarzrE1Zs2yXjw+SMdpKBGeSVxIiuedBs5uOZRqLP3myzx33xziNHx8peAqTwCWyUyBbR6K7fzwEUdj24HqHdlB1O4zu1Y3mNyMp6/du4isIle/cxe2tsFg8+mJE+9FZJZx9M9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331176; c=relaxed/simple;
	bh=mhRBTwptysF9JNl9u86v42nktnUR7haDgpBPxNG7d3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCLgng5oiQAP9z2K4V28Z0hT/M6tFsssBGKY138aZ3mIXL6lQqAQ0TWaHRSBFsAndqbowhuVYLB4HQuDpO5EZgsydGs0ko2SBtV+qUrvlNit7kWDPxAjCyJq+GuXU5Fj47q58RQwuoPPSyKLdR9eYpUqXTn91oYsaoaukeMrZeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHBgmBlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erSA+aSw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3WLv33903733
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=; b=eHBgmBloYcRM9u6R
	MZLky2+ZXTsDQWNH7n1FiHziFmUZtrQFJGZBJZ5iCJ+e7Xq2XdVENClQ/A+DGRiT
	BZI5QtbbESdcsfoR6FYvP1BuZS5Dq2NtiJiTs7GjScR7Jet45iZvoHDjKc0toiQd
	UvzPgqVjeYIibgpAmSa9NxM6JAHho6zc7R5MsZOqJtQmO1k1zDNi3AGrtpbhcLiq
	BfnHO3cFyOhbl5lCjR9drbt6WLRCq7atkwXJ1uEla9nbwOBU8iV2RwkJmJe14UcW
	+9hdDGtP++3kYfcKyQSlUCJOTaq5SB9fRsac7dRLHoLaY7fCr3bp78ZZ81C6R2DM
	XyKnjw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0gd2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:46:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954803bd74so9522756d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774331170; x=1774935970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=;
        b=erSA+aSw9lTuM2cnqiizUQoq09JgazNvh/FGlEwk8ch5n2anq7YRk6iEPvBKabtFky
         syYTsTfoFHN6Kx4jM8/SmgTEOYwvE1WrKAxzxD8j9257EfC7DQZQGtF9IephEXl6ini8
         5Aol8oPzHnKmcQ01uEPenx92joKV6nfMRwq62tO2/G7mbe2G+kOTSpD+9MoZrTCKGLvu
         zZLx95iLke1XrrBQYaVR4ewkKbMuQqk/E7o9ZuLzFKTdd9lj0535T6igwLHTBWnjLFtg
         qQ25IEXJ4/yE22FsIPbYAOX788wvdhmvjeibiLItBXYDOzlc8JeLCxpxwjG+Z6NgSaiH
         DmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774331170; x=1774935970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=;
        b=lwG3n/RwebSxMtp6Vf2SW3J7p0R4T4XaQ/j5n/Zz/CuQJ4IzxYgrklH/av8z5exYVb
         6o8IZOWtLEp6jFkMm0gAINc8habPnfED5w1uVyDZ1MqMbygNNhS8MoDMe5ogDccFhkwr
         rlHN2BPIQxTpELDdVyaOx79Ajkkh0lC0YbHG2bMRJASeObjz371/T9oYYfexZCY/kBZP
         7ROks+42RgMjpb3Ro76+tDmKX+313O6aY6M4UG5uqC4PMoFMGLdBFjb+EykPNzFPPfYf
         3h3lnTVXiQ956jLYkL5IEgxUD/XUduE6vcJIpHoJou/2LhCaS3guvszJ/h/T2rodGp6V
         ZHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwW8BDZYa/4qVu5nt8pnCzfiU5trLTgOwxdXkmLdqCJW/xtRPRjU1breFNiwjlX/UEm0VS0ntDnTXOPmrG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs1VZJys/mGU1Bu9mJWecFVpWYiclWuYzOK3Khm+xnzkuq2r68
	bITV7obHgXtiTts49q63n0Y1xhhATIKWXFosAaVDb4X2iCg/gWNxmyYWi6PfiBOh4o0j1l/lqXZ
	squxyCnVxpDb4ycvXk5JCCoux/d51fxAtSD3su9lVEPisw0BgfP802bvXZx99r1tVQpvn
X-Gm-Gg: ATEYQzwCTnQMOhl09QwyMFs/INFLi6Yk/7NXp6v9SmyoYECdboDlMPbFkZ2OarW0jBk
	YX/XmBmRTSwIlFgYCRT3ti6lumrsSJ4qb2+PG8D2tELGr5YNxyDSrKRhOBsYEjwFkZJ34NuoEKR
	VzKTS3u/s27cmSVC0puISp27w/ousZ+GmF7e2OZPjI+OoFHZXc4MveF0b/taj6pWw3vChW4T8VU
	+BkKSJQJmRUIkfXWtghAZQS/Gea1Xrz4t6UcO00ct6EkJhSyH11BHzQo3eGyeS3vaBMPdHfUmRI
	JxJhZGUkyKX/tpBgf7FOdbJRw7HyY2htjkHaNDaX8ySWwgyngdFsuGMC79T73L1KllQYIz47x05
	wKLiPDExQlWv7a1s3XVUwysMGiz+GvnSRzGO7S/zl9QEjZfJeT02esy7XRmkrExQX/Cd1z8YfjE
	An61AmYSJ+1Q==
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id 6a1803df08f44-89c85a9537cmr186281056d6.35.1774331170529;
        Mon, 23 Mar 2026 22:46:10 -0700 (PDT)
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id 6a1803df08f44-89c85a9537cmr186280926d6.35.1774331170106;
        Mon, 23 Mar 2026 22:46:10 -0700 (PDT)
Received: from [10.111.162.220] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335402sm130932366d6.25.2026.03.23.22.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:46:09 -0700 (PDT)
Message-ID: <2a786e5a-bace-4442-93ba-ed27a13e06eb@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:46:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: talos: Add camss node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
 <20260112-sm6150-camss-v4-3-0cd576d627f7@oss.qualcomm.com>
 <acH_30LE_xHXneqf@baldur>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <acH_30LE_xHXneqf@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vSUmvmOyTec4be5JUOrjQxh7pkN39cRw
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c22523 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8aYgeAFh18_nvhlzcWEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vSUmvmOyTec4be5JUOrjQxh7pkN39cRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0NSBTYWx0ZWRfX1iGGUofmBIQ7
 5fIU2SYZM71Ru5H8UIkwjQflamxjGZkktTqVNB5zDfa9lzFwJWa3QF4aPvODdEUERNqsKN5bCo+
 7t1DMQip2DMTToTShSqfEpNS3Kdm4bRrXBOd9k8U9U+uv9WMMFpeoue0GPe76OKJNtFfCwbhiK5
 H8K6KXQyIZpshWeSjdIOEpXZuoUqt3zMhSdkMdIBXIBMpAW+/FxxSWZ1tgj0TRQxCOwKvFNmoNb
 IT28rUgDngpkkj23QGqrG0CssufDgQkZzhnfHCFjB7WsaE3MNfJIOPskDdhc1oa6T1l09De569H
 VR5mSY8uCADu6qI4EWTIWa4bWykpuR33AbJRn02+iac/0d8QVqZMj7i1p+k2dune8raf/9fAe2q
 njf9deq0r1TrNmPzfYBtHrC3gMKm4BZerie6E25OFn9Mxzk+5YyXFGW3dSM5u4Z4FzUWR6/CFDU
 p+yWmkTBC6IH/xWiBFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240045
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99560-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,acb3000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 746C330269A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 11:07 AM, Bjorn Andersson wrote:
> On Mon, Jan 12, 2026 at 04:04:54PM +0800, Wenmeng Liu wrote:
>> Add node for the SM6150 camera subsystem.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: isp@acb3000 (qcom,sm6150-camss) interrupts: [[0, 464, 1, 0], [466, 1, 0, 468], [1, 0, 477, 1], [0, 478, 1, 0], [479, 1, 0, 465], [1, 0, 467, 1], [0, 469, 1, 0], [459, 1, 0, 461], [1, 0, 463, 1], [0, 475, 1, 0], [474, 1, 0, 476], [1]] is too short
> 
> Regards,
> Bjorn

this is old version, v6 has been posted.
https://lore.kernel.org/all/2e13c91a-6d87-4c2b-8a98-0b58f97023ed@oss.qualcomm.com/

Thanks,
Wenmeng

