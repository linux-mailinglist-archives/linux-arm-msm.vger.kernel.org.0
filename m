Return-Path: <linux-arm-msm+bounces-95285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHohBVYLqGn2nQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:37:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03F1FE738
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 817413105606
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 10:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3B23A257B;
	Wed,  4 Mar 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWP4kULZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsmRHXyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EA03A256A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620358; cv=none; b=gDtDa2d0kJfuKJcL2fFzGA4VgzEhXMfz8pvAX5OIwu5Mh3iZfVdpq7w0qnJl6i+qBk2lP0CFTzuWBjrHNNMX+ooVW2F8yhxCrdiWgB3HUCgjwTxeTvqzrAhy7UArihJPLKgPxQF5BVbFDu0aqtVpPniTYiwig7fusOFGB+J9TU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620358; c=relaxed/simple;
	bh=RZJqjHcWljwgglzRnGIL4K0cq5N0Vm956creLFYveOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkNxuw/yln9QbYm46JzoDAXFF15+QLGTatHxP8YulA8Xz9u3Pit9z13RM4t7Rzgc8PvfUnY9glANZGuM8LgaC7mNgpynxjMT1p45pgbzKgcvPXuQWZhmI1zqNuEIJNCBOlSXcoEHf2vo9BOJmdaceDpo1D0ueJ5NyzL6fMx29yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWP4kULZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsmRHXyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SZfh3110562
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 10:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD/fzWEvkZUb0Aeqg8CKGCrD5Hp3noy4/2L2GfbrChM=; b=MWP4kULZIakaZCeO
	zhzxs6HaMnpq6PTEhvzCmOWcBPwLWJDftweYgysUed37fsAXuwVfCd2oBjoLFi1B
	T6XXLOdfbetJbHBfoVgiKhY21BGQQ2ED0UL02T6p41/FjXU8y/cUQvh8K/rc55YZ
	TMiFTvFp1XjDViTIM6PZrwuuzYM0ksMjSE9N1NdMmDftTJIepgfkkLvoAN/9zJHE
	Myh+Sj9qaM1jKGtoNULr/NnOH+OqDSlduGB3RBhH+vwFA3LcE/6R/OJ2r7ah6MKN
	SJ2/13hV4mrq+XaaVMg9l32dYsukJenGzA32E2uJPZ6BljQZrqQbO8iKVlFsVccs
	PGSNNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2at5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 10:32:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38a5dc3cso534531785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772620355; x=1773225155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD/fzWEvkZUb0Aeqg8CKGCrD5Hp3noy4/2L2GfbrChM=;
        b=ZsmRHXyMweT3vZAnWOgpXFGTSeyHKEnt8lr726K5xi2zS3rxEFuZ8iDHQSHC6oWpgT
         FBGgI1CqlmuR61WTHpOtFPIPVklixQdMYOgVs2ggTcQx5FKhzo2p+AV+qbyxu7xO/RZP
         BsvHCyF9oz57ew9EMjsS9d/zAV7DWsurIJVhJywk2nrCIepdVI41CELbGwYVGSP+/PUA
         BCyYl6/bdBP+3VxSpHAaxKPE/ipM6n994svvQj4OxCrLYLjk9vRmNECiHHxggFUfxWvC
         lm4uQT91i7epvnuPJC8pKZ+PUNeFe4GWjXcsN3p6TZgM705lqMNhZ0TbbiGjewm0Uriw
         O/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772620355; x=1773225155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD/fzWEvkZUb0Aeqg8CKGCrD5Hp3noy4/2L2GfbrChM=;
        b=tWfHPpLw7paExE9eomWlCPW/xcrtqvZYW26W9i+xGg9oO+z+rLVcwSVsHsiXfQblqg
         e5r7XTLBSKRVvp0dlNbtQWRTYGn/G71uG0tjHXqWBT7bmtKItVBTzC10RKXE7pawh1Xp
         CHqLWjOwvTL+EQpHHfdhXLnSB3EzfRo10Hl7WDkiR/5982QITwoTLzhD1pjYrxRybGnJ
         MVxoZcBfvcmu6rCETKvUozrvB0v1bHTbPyYp2M+z51lvsvXqZ3+iU7EcUfssPWLVk5oN
         NfMRg6lqu1S+u35H9ffoXE9GO2Us7obIwNFaWlcU5oQBntVC5+F9hQGUJXREk0/RBtI2
         Qj3g==
X-Forwarded-Encrypted: i=1; AJvYcCVi4zxxTL4FsAbNSYd+qRVMRer+CyZDF9NZmHW3uK+WKH+Di4sqWapZXmyuSurYnqZb/jAfT3n5OVbWQr+3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AULpjmvhISuCCcT5wjpZI3Ll8GSKWu7uVOc1sUxdZOG/Li6L
	QO4jjWh1XaGAjk24RFugjGf/xyzKFF7q2SQlHu2dKaJWIigNgk7Nji/V8nnV39IwgwZ9MFeHoWd
	GxmBrnesifTXBT2ndj3dUU1ghHqXlk36wsYVAw5bRdOiXyjK+H9SpK+FDZZCPNxYILrlQ
X-Gm-Gg: ATEYQzy69D3Nwv/S5aiGwtOKag67FREFgs/RQNWzc+8rhrJN024MoFbVYGF6teyKKYk
	QFXez4lGx+1yld00M63qacnMNNhjaF3VKrqWMrWrlSEVgayOHGQiz05YlihHaaIJB4fO+IYiteV
	28br8rFtjf6EWJRejDKyDDLy5YwxSGgE/b8Umoh5neJ7QLlFAw+8VjGKqmPfJKmb9dCCNY8uGw1
	8qhmFNegDoAUe0odqFSTrWXfHy6r4uFhY73pkhLsg3lAUQCSY8Hf6QImNKTdSGlh/0QrMXefKL/
	qR5hQcEX1ER4KfScaHplZbccVUbbkMs8GKHJh222Z27Z5O4o+R7+bJ1Ix5X6JwGBb6w5ZCaxuXy
	E4D9APww37wj3buEdvfu6C2m0W8lbO1zj6JyvoogvzbYDd2Bd1mzHV8bZsRXgB2P+exLewroOXJ
	GSu7o=
X-Received: by 2002:a05:620a:46a4:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cd5af181b0mr131177285a.3.1772620355562;
        Wed, 04 Mar 2026 02:32:35 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cd5af181b0mr131175785a.3.1772620354995;
        Wed, 04 Mar 2026 02:32:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm1224812a12.17.2026.03.04.02.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 02:32:34 -0800 (PST)
Message-ID: <5bdfb62f-c3d2-4705-a49c-8830577342f9@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@nxsw.ie>, Bryan O'Donoghue <bod@kernel.org>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <676e2a9f-d274-40fa-988f-e9388ba40f71@nxsw.ie>
 <04f22394-2dbb-4b7b-bce3-9b41ebfb7709@oss.qualcomm.com>
 <1082062b-87a7-4254-b5e7-2dc3769a619f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1082062b-87a7-4254-b5e7-2dc3769a619f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a80a44 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JUammnum_Y0_sDqSRXIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: AjhOqMYa34P96ZjRTJOX_77V53wlH7Bq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4MSBTYWx0ZWRfX6Yyzn7f1cegt
 VDnF8P4ino8sLeFho84zU0LHYmyiTFPGdSaxyzlyaagT8KpHK4UvH6mlUe9apGNvMI19WXSgb+l
 M460qOoghdBlvOsu4mKaCLcjVTcuLcEFbm3tAFP4LTsMwvNVmGjZdmREeMrZJtjmIaLK+WSHPYJ
 JJASf0DHPsyeNYz5yMOHQB1iO9ZxXH5+3w1q3fh7wqrnyj9fYP0U35XfIMzfI5bwto7tzEvu96q
 zMz5/+2/BjBGHFQG1/v3q3QUsShYVXCrpG7je1K7lXk9TuNUeDnHcICzazadTvu+L4ewRU6K7dM
 4qR+3VWbWLz0OQVkdr0RTh+nrbBxg/nXXtZFayakVAso7GMGYn7giZcep/P6eggVx598IG/9ztr
 4htS7/nJfXgvsrp4blfDZdjTPK42aFArD4NXfSDeD4dD9m63RQes6eleiov3OLXZi5rkFj4u0yg
 tUCOq6OZ9veKJKF3AeA==
X-Proofpoint-GUID: AjhOqMYa34P96ZjRTJOX_77V53wlH7Bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040081
X-Rspamd-Queue-Id: 6F03F1FE738
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95285-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 3:56 PM, Bryan O'Donoghue wrote:
> On 03/03/2026 12:34, Konrad Dybcio wrote:
>> That depends on the use case.
>>
>> MXA is always-on (that's the 'A' in the name, as opposed to 'C'
>> for 'Collapsible'), but it's not always at the required performance
>> state (svs, nom, etc.). For some clock controllers specifically, there
>> is no need to put them into the picture, as the rail may be unconnected
>> altogether, or only used for some retention mechanisms (which only
>> require the rail to be enabled and nothing more)
> 
> Does this rail have an OPP table you can share ?

Camera clocks on X1 (mclks and the fixed PLL2, which is exclusively used
to derive MCLKs) that potentially depend on this rail (awaiting Taniya's
opinion on the other thread [1]) would only need LOWSVS_D1 for all of
their configurations (ftbl_cam_cc_mclk0_clk_src[])

i.e. let's wait for a definitive answer as there's a lot of layers..

[1] https://lore.kernel.org/linux-arm-msm/382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com/

Konrad

