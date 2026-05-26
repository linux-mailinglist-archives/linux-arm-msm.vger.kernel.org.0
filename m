Return-Path: <linux-arm-msm+bounces-109732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODvfOaxGFWqLUAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:07:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 979845D17B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFCF0300ACBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742EB3C5539;
	Tue, 26 May 2026 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjTjcTFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwq3WY4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861043C4B8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779239; cv=none; b=RtQC1Tj/c4rrFPbGdbVKSXzaczsEIqi6PiIevpWVmOe/n7AZnNJIEkA5lLMK8UeuLMdWpdWfRpNE/xw9ZBIZH9VY/P46BrPwsL24ebad6MV530+FTK1ZysVXbP5lXI6uTsXx/XyxNB9JZCPXFZ0YhYULsGMKCCOXL8mRFUDH/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779239; c=relaxed/simple;
	bh=hA9nsEvPFqbMIaleKcdvo8RJFFOUhGhAUa/aGYy974U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqQqLw1b9KX6ofpFV6UeqLSVLxRe8SMWl3Umw5kRxNTFk2WZNcxwNSqcw/ncZC84M3P737YXy9flao/9mErR8saPkJgP7tomkSPbJ+7eHJmdZtnQwqR437kv9H34htzJRj8PXLwmnDvTthmwDbA11UF+uLnwNOg/KYC//8yWqYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjTjcTFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwq3WY4G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xssv1604663
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=; b=QjTjcTFrs3rK3har
	rh9Grnfg5Esuvrc8gj/V2izwjrXwLKdhCgEv6uLlIcjRLXfT7rhXq0c2soLN+9AE
	RmTnIrSYgiDcz1giUHtfbe9sBw0B30hP5IYNi4YHMgFLVdXYNQlKp7CPTWvI+2JI
	/oo4c4t3NlVVRM0+f8MQIkwHS6sjftIHhw+IgzqIPwrZ1OABXfjIQ9Fofjgoi+uI
	TiaWOTRtf73AlSZk5TBkFvAWHdWLcU/70y8fzw2qYcYEVza1TRyvotYjEOYbuFbH
	0pe9nx12LoojX6LiHIcTdl8e8TJ+gmxiIwC4OpoTylB9sOprySF6rSdNW8W1VfZt
	O187qA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3r7vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:07:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8525f0807aso4515727a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779233; x=1780384033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=;
        b=jwq3WY4Gza9aVed+GaKhtxMKkl4deZoZQH7p+KTohijNYxQckKmUagJCLiWFZUwUTV
         Nm54XsKwTPp2+hA5npof70D20zafXfg15D+laYPYEOB4IX5tJXB4Zhp1XMNMj+9C0ENf
         /Fs/4wWyJwnqJ5HOQic05kkaCFqhr68MQuaCE4vg1t/5mYWpSu8j1HCxRLB1w5Oa9adJ
         dx7iULWfN+HRXWGyRCrPLiK9BdbVP4+YM5paiSV7p0L/rQ0Va89lufArje0RsTaI8mTe
         HhJ/u32SohLplKkU5BWDfatRZWnymp3S3S97Mfv8cYd8Eg1LIHFV6cdIOgI9+IgOYsnZ
         noCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779233; x=1780384033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=;
        b=DkdrxkBu6IDxW4xn0JMviSA2We79DksIX8m+vI1FscymuGvEB3g0hz++4mvdsE8l0v
         jASDhPY820drq0UAZzySWZeh9fK1i+1v9iFwZ+/q8VD1mCeyIuLkmTnxWofonwiXwHyj
         HMnO8Q6uK1lQaN/XSzvZG8DvVXRUs1M3LNA4/NDfFeOSg6CBu+/W8Y+s4rcHbxVO/pVy
         qlWL6UTr0vYbuufD6RN+hTVH93n68kZNKv90o5yy4wizmOEmrDu1DORuwTJKFVauOw8X
         gpMcoEeskr4WXWY8XheD9D9ad8Ql//VBC+At2c5elomEr8whYAC22uVdRqNaYHUu1upB
         U46g==
X-Forwarded-Encrypted: i=1; AFNElJ+aBnMq0Ek3oqSh5JTftFgNDK2ZVW1O5WV9ahgW8FpJo1WJi67xPJ+dGSGjIc+n96UrYmp6KIQIHe3QsWhc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx172QHJxyVkfub1Eyqn8KtmyuWpzu4btv5Y5UpcgJ2eNdhXviI
	9PLDj1Bg1zNPEPiud94NdaOEJ0OOCEPrXBZI2QzGCUbLSUPHkj7nAQfpCnZRjAEDgALHFyGnxme
	iE47l6zLlYmwyGR+vwPgfouDiZvtM1LZc48DgNk4ho5Jc8iCL3PG9Lydd0Ql4O7SjTuDk
X-Gm-Gg: Acq92OE/0leZ9gn8N6FOVCdrObHeR43zeslBXLon/qs1yTvsBFVNHtkDFEr4T7ZHZwm
	pz/DPGNSkxLMTFAKcOheeA7pd+l0MXOJe0Lr/C7BDM0bqJQ7z8GDN4+wGDxtGsrY8ynePWBCR7J
	xkXdWoP/hRGn/wzQR4XAx1Wm7mkuAPxQ38CCnFN8gqPD6VePUvxmHPPyU96PtSLzypbe7GFjW/o
	oKVoeK3OQwDm6zZaeVmmgXPnW5vOEO7TvhsvCbI9gNgktruJgtrLoGI3+QbE/k09MpyUBDEmvcI
	Cvj1ehhiSt/J5QmqIpa1xW4j3QWOBys/thIn4OjF4hj+YNZSHQwwoq9BmlDmofpkR/Z/rSa+ea2
	nzCCggOHsEK6V+B1ctYBmsGvnQ8Vog30/i0z7R7kYuN5Rjmkz
X-Received: by 2002:a05:6a21:3285:b0:3a0:adc5:52c1 with SMTP id adf61e73a8af0-3b328c4cbf0mr18666814637.11.1779779233232;
        Tue, 26 May 2026 00:07:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:3285:b0:3a0:adc5:52c1 with SMTP id adf61e73a8af0-3b328c4cbf0mr18666773637.11.1779779232727;
        Tue, 26 May 2026 00:07:12 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb3083sm11332846b3a.43.2026.05.26.00.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:07:12 -0700 (PDT)
Message-ID: <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:37:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MCBTYWx0ZWRfXyk2JlL1wlxNk
 klQ3NzHBfNzSOOPovxvBjtooINOPaazYfde/bl32XWtNW72DyI1qpjm78YBUAM1PMR6FRXz8R7S
 geZg+5oTd0sKgez2UZy0yWMyKwfXqEd25IzHat16TkJTOGnpWmmYasRzjlxnGuT6b14X0DlTcQ9
 QeJaEappDJLwD/XAbH0c8Yuai3y/gJpcTdpOcU33/p5nSjClL+MP/S9ntOAcubKlPlADfEv814q
 8SxfURW+jhzpWY4qi5NCAAzHL3JCmu86r1FcV4LzoeRsfP1iXCWhinF7Y5cBwfdj7qxvA/yaZ0N
 CqSvTDIJgAWwxbt/P9KqUbCQvn6H4jlVPvNvyUodZ7aNDNebxO5HNgaeIpZGrryMPfWZCrXELrE
 1E8Y6uLZJhW3Np5fcusMPq4XDx5ftBhItL9eSjcwv8Qlr/dKW3XJLn5dd+3AQIXMYUV8OaNtqMn
 RCMImXX+CNsAl7tXOKg==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a1546a2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wZGdkmvsolkkRd8yDogA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Vf6mjZrP0KRyTctVFo2n-qY-ItSSnMZ0
X-Proofpoint-GUID: Vf6mjZrP0KRyTctVFo2n-qY-ItSSnMZ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109732-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 979845D17B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>> registered as standalone GCC branch clocks.
> 
> , otherwise .... what?

If registered as normal branch clocks, they may be gated, which
breaks access to the EVA clock controller during clock controller probe.

-- 
Thanks,
Taniya Das


