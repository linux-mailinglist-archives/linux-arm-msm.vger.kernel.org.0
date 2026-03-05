Return-Path: <linux-arm-msm+bounces-95560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CeVCcpPqWmd4gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:41:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB3920EB99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E3F8307B16F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3AC3793C0;
	Thu,  5 Mar 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzbctnVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATZKfuuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525337AA6D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703223; cv=none; b=uZuLu1scqKnXuTSz6e5AoSLm2qI7NLz+f0nh5pRqmrRtNYBVWmIoF8Hq1bl26td+z0kMXmaAIDR40KqMwfS5xLoBXsybsgk8qE+MPYEI3unIPjKzvtvCdFIh67ZvRRJ9WDMYL+Uur4lcKIaIVAV8g51BFhkben+WL07MjABrrt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703223; c=relaxed/simple;
	bh=HOFCRWjfrMQ86SS6aNSy6MkJAPJRhPPCTc1Ev4hVuSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMa3fnjiWIfEYgZXZOxynrXcK83wz76u2IRK5aQ6pBVkDjt7hdPtdujFyx7UsqUnry7EtSXeihey1hl+yKQ3ZkXgyuHt6eguchw7ILCXVxiYR1ZWwu2revSHVd0SCCYX49Tcy9GOkJbjAcibMkNX7rUWzIM1ichOt2Z4j3GcZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzbctnVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATZKfuuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258sQ5N2665152
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=; b=SzbctnVqNSZ+NFa5
	KZNgrd87lqL1C4EWwyQX3KRCSqm4AR1CtRNPJmQQtSDMvdXfmaYnmP1uJ9mcoU39
	x5oHt1CxUbWXIScr5LqJGXtUzjCR3EYOjo2JeJIVt2bcNqLBumFoF2xCHxj8HJ8p
	3uVKCn8YTKDR50zX3M+04OETB2mKG0qWZNedQEdQDbDZb0bLJzOCAmlar5/bjaut
	YMjVGHQb1+qtI0EAX15PuyQtZJgJfRzxhNIuefwEoIPI+6NkaOq+T0x/MsEecMhn
	ShB8NHHzJIhEeKGVmnCBE1EO3Fsny1DEDi9Ymkt7u8i8x3T9dawWdfRZXVHjFv7c
	+rn9/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb25u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:33:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so613599585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772703220; x=1773308020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=ATZKfuufR3uvkuhUERGJHSMRgrIUAJjOmwORCZ4HmuImcI9xBZcPVAWNrKsKOHBh2I
         N2Eay+ZjEaXlKu6EGzTD3aDcQhFYei4NjhtRiZmBQ38Ue0Ls8bp/xIAUNcJd4ESz4/4C
         w8ok9VblRFiqfib/yTqRE3Zur5OyakLCryNGeAIb5OcADKxQbE1sK9ke+Ayjg5jX3v9w
         QFQ8UiT2QII/5hxCO2RMKj5goiNn8QV8CK96kkvs9abJN0zvpbQqKmS8o3brPOrIqcv6
         MoEcyepRiTknpHsSNePPmv4I+dE32vzNxWATQrHXobq1VG7SdRDuA4HYmzz6iLLXD7+k
         KVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703220; x=1773308020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=nW5Gix6MHm0ETg1YnDKLnExZKtBgn8wIanxqgQboUk0+O1qrMTjB+AjFns79J+DaLT
         u9KcDvpe+VBIwhRNKCCfarhB71TAiIjzDPj2Tk0ymPZhNhP008YwSqVLKSYM5DO1SaxH
         RKazNJ31BdLXKb7nZurR01sX4xcFnuD0H4mBYfCfvm94QxkxULNG+dNl/9gj+yvOavPI
         l77Q4AuTakF9tWAlecmhp1yyq8Fl+8tY57Ml+ubEsdA8vJ9dP7IPO8b9dtKTjPnZjGJi
         VPkGwVCwlqYy1qrqdtKcxRqFrhyOREHopyRqZEI+kDBpRh32YY9pbqQh2HUCteGbnegd
         DKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhgVZytGnw2hRsoE6xiayaxnItTzLeRoU8/UfVJ0qhCgJh8zUgbnu8HNMaXTNE2ACuuZav79c9+Yy0MXhq@vger.kernel.org
X-Gm-Message-State: AOJu0YzAfbfzihpSoYAf408uBwojOm6zG/dzluzo8XocmD1yPuor1nzE
	MMCUaPjMluN/vhlpMapuhk89/xWI+1cfzB9hERIek8LzyTwtOSXe0RbpBkcWryFQ6tB+C2MdzDg
	/bYlrNHRxXtvZK+H+ErXjcZoGWZLKF8BoqcvayZf4RcWL0eeRB7/cn2Vv553/d7/81wdW
X-Gm-Gg: ATEYQzyylCWiamVoVyA7+mG0bId05g5mJcDnHXB3grAhOBpRJRQUWnb8FA0M+WKB+Xq
	DXttUBiIqHeCPXu6c9uOyWI4teLM5NyN/YFcEge9IQ8jjmT2wmaWm6DP7+Kxwe6RHNo1Wvv2cdE
	MXF3HSzpcF7EWoYqhAStaNacTCOSp4YrBrlEYV8pfdJyhLzIy4hUgnv+4d6OEG2WLCWKOYOQo2X
	ME/6TVEw+fgaFRxjRRrAO6IORfwnHbfK88lZbgUUBtD4Cne0bRmDpF1MdU/MpJMBNWhW3kQ8gzF
	dPNlIL6jjnT+REEjN2w2Zisb7Z59Zv5hTpaZdk4PUh44inFC303L5yUq8ztSTe24gXr1BAZ+80W
	6sJJxDUlvCFpCfTsRRUL8Hc0HHWTcI1VJJ1+aAw0x9zPsrqd4YphYqyCvOiI0vLJ1xsK03pv5EZ
	WOOPw=
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462863785a.10.1772703220109;
        Thu, 05 Mar 2026 01:33:40 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462859985a.10.1772703219701;
        Thu, 05 Mar 2026 01:33:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm884380166b.41.2026.03.05.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:33:38 -0800 (PST)
Message-ID: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:33:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NiBTYWx0ZWRfX4EfVcVlT3Jzd
 0gauCtcqOJmO4OuMT1G/UuhnY6rKHgdN5JdlGpNA5BnkOGbLldNY3VpBK/CD2q3F9ce/IMsobEi
 pG1toNy7mPjvFLY9RIgdIDudJpCCGN9di4OSqJabo/mKHUt40F4gPihh9JPPHh91uESpgLy7Sdv
 CaFAPhjiPkjXKLicEZ+f8PnR7sdduwwmd/btN2iDP7QGTrlQIoafpn0uDtBQKDFPWK2XWGj9Mn7
 mKyrQVKUju4RS2SfGQpnzqSpKjNuaUdHiKInCdBYFci6FN9X7SNTARFpdFXOsw9EJj3CkE095vF
 xHd8l2vfqpvXvVHNYjy2/WNuZJ7vvTepWl6lo8KTGqHX0dspy+7kWIHGV18xfo8qx4MU3zloJRI
 IFlLaufZGMi8ax7BLiCjB101O1T5YKnLy2OFOllbZvlA72fkg7d7SzFPOuJKui/rLHy/CxfGV9K
 aLcU0zWKtcYGTnYfO5g==
X-Proofpoint-GUID: k987hN4-xlL5Z6IcBtH-ioFAZW-FfMAV
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a94df5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: k987hN4-xlL5Z6IcBtH-ioFAZW-FfMAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050076
X-Rspamd-Queue-Id: 2EB3920EB99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95560-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[glider.be,arm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.

I'm having trouble finding where that's used on pre-v3 even.. does
that actually get processed on the older iterations?

Konrad

