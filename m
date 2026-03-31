Return-Path: <linux-arm-msm+bounces-101000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPnTAPmSy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:25:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8785D367046
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED7E3044BAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B5E3ED104;
	Tue, 31 Mar 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzCECOzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="As7wIdhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11973EB81C
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948812; cv=none; b=XETyxWY2iRXZ6TFAinhSUvb9ak0kI6QEaTnKxi44xhSkIq+O2ltXCDc2B9KF1uiineSzO7OJq2LLdTkCH62SclunB6MT9FVIKFwDORmOfBoGJO6vZSsJcIWNsryZt6S+5gxZzeX1otw4houUV5VWRkoCbQ65MMokbmrcFXkWXSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948812; c=relaxed/simple;
	bh=Yl9t6/Pl+3fK6Utt6eipDPNK7U0WU7L65KCnQoMDdZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=my3C1wjd3m9mYpwA9Lv3zjuVhr8TnVjWb3iR2Tfx13OBBBkqQ09qdWgfO/h2Gf26cxpG1nftHUJY0XUxlqQelflurS1NscSQOu2UlagVylAn8PHE4LdVhJj/gJxsvU9P1xC3ejktlNxA0nHSUeH/oR3o/oj3B+kx6RNVyIC4kkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzCECOzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=As7wIdhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V45INN4053308
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	at4Di3FGHE4l76i9qpCcTEum1hZPNnHxC78wx8v8c0M=; b=QzCECOzVt4bTbuf5
	qlgtWMNsWM5k+HxEeRF0zKOAejbL0DHvCEXqxfs1jaJai/2sv9KRQ6hnhYhh4gTM
	C0omDJPFBljTEGOi7FfGjDM3Yf13IEF+q0agZGblpx3yYCpUiSWCKMPXa5BkYSo1
	1Nqbcv9MeZK7Ix0sr8MA27Ldx7Ryzr5bRoGIZlSVwgbYahQ+QYwan9Uqj9a6j0R6
	JCquZlJ0k0p2Q1Ptsr3fE3gXJAUFUD2BqPfC8XlfMidHbVt3CdruZGTROPWTyMv5
	y9DPDUf30ehDFhjlHLcBUC2rS8/CDhiFUDnc8vUlY6I3feNy6gHC2Ler7qNQgSPB
	OW7BOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3ataa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:20:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c96f5d9aso59861045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948811; x=1775553611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=at4Di3FGHE4l76i9qpCcTEum1hZPNnHxC78wx8v8c0M=;
        b=As7wIdhdTJMi2txwLZzgRl5JeSg6IPJIxqBEEILtj2cgEhVQd8bJhffCcEoctpqE/M
         QEHJwx7trxGlcgIO40epvshbQ6u6rID5msPpJKo11IYLlu43meXIVhBY4xgo3m4scmbK
         fbBoYkZ1dWYRc3hM5NjMqrdBGV7suY3RH6e1EKBgBfiT9wryuwKI9M6OOpcs3bGVYfOm
         B6FPv9QAykIajiQ4CMueiN8iyApq/QjkAE4Q/mLfLyTakRzLB0pqGROFppEwPwL/UqNS
         70t+FkScasSTmJpBOwDmpcGH5kP/bwDqUUDoq9s3qPyMzGmyB1a2mzQL+TuyJQCeyrMG
         3aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948811; x=1775553611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at4Di3FGHE4l76i9qpCcTEum1hZPNnHxC78wx8v8c0M=;
        b=BEzbUK5gqhKbrd396q4TNzXrW+zZ65C2cqB15pPOY5cnpf5bp6bUlnMll6VgFspApl
         zw+/tzJetOtotRIS9mQOFMSm/7Do9xy2XnA7faJdKjkAFNn13adqaFNFCpJHa7KjLCUg
         nndsLcnWB+bqeFbykWPxe3FLcgFAHKfEpkb3ER+Xv7y84cPcOtv57fPNxE5qLfFo5aWX
         EcLtlgl9LUs49YDinnYPbQOXSfD6VOc0rdxD2y4HWoBHJm0bVfqoF8t+ydm+IhHe/wgJ
         eFVvM31dZidhtUynRChFxAQuXDBzSqP5X558Y6OLBRTH8UjDr/4PJPWE47KZlB0VC0pq
         Uu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHiB/b3n155ft/sUFTpriNoVM/ZQiaS6s9+LuTCFtAp7aFr52DSoWMaV4SWAzdoQtJJQgK5iWEvQTGeWEx@vger.kernel.org
X-Gm-Message-State: AOJu0YzabZXMqVfepqvVtsNMHaqfKLFcCHPA20Ma41lGqdy0MsONMcBH
	LMgB1mGdUHm7N7v3Wcl4MF2Q6j+AZ6IRS0LuhRAMzJniBrsDgoBn+bIZ0ah3BDVMZ5BJAp9rVbf
	m2h25OFZ7V5rIK7iEBWKiF6VF6iv1xRG2pM/+4eIY1U02nciBIsRmCorQfHwvV2k0sIb8
X-Gm-Gg: ATEYQzy3DYw46+q1gJX/5KWraoblvXZx6I6I4RsZdEJc6bZonTuOFcZ6ZK74296UuBP
	4BKGQzjeQ6VLbcMkVIXetwQlVTXk+3Mu8SdMi4RQ08t7T9caOnsVN9myXwFFeBsP9lozclfOBdI
	SO2aDKeHsRhhYdxk4P+Pv20BmBzmjRfw1Nka1y3BrVAKPNqA+s39tq2D5Lx6daJxs9FfokAdqVg
	dcuThzgSZJN7AlHLuNJx8Kfs86R/B9nTJ3aMaxfiW5/u5zrK1NQcaCrHLJM/XrjPdBGpLWZru28
	sBUq7+bnSZeicocUjeEceD4lp3XQ8832ixSnDgIAO3QSFH78bedBRMUFqngN5w6EDEVycsB5AI3
	CJzXXP1dJu3Jnfp0cbTvvw+9PhVIjickw4fZK2PQRnaq3umbBHA==
X-Received: by 2002:a17:902:ce12:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2b0cdcdbb73mr180529745ad.28.1774948810547;
        Tue, 31 Mar 2026 02:20:10 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2b0cdcdbb73mr180529395ad.28.1774948810113;
        Tue, 31 Mar 2026 02:20:10 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm129254675ad.72.2026.03.31.02.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:20:09 -0700 (PDT)
Message-ID: <2327d5ef-f25f-4086-b543-aeebdb187b8a@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:50:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ecd73358-70ee-4ddc-ab99-aecdf084c172@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb91cb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=lzig9Z7y9dNEH8IpingA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UqIjMA79quOwr-QyBX4b1ThrpR1ZngEV
X-Proofpoint-GUID: UqIjMA79quOwr-QyBX4b1ThrpR1ZngEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX4J6X51WoSL4p
 7TSkP76aH8pERt5gPoQt8DyTZveyOV8G+i6JXOnn+H84PjgWgox+cJhj2e8BcxPRCH+1V3nh1zw
 5LdqJ2TDySfpGr1K755h1tncag48K+g+d8lC/bSkEciMLXR51jDPRhbh4qAWJiA8/Rz3TmE7eTx
 n/knQ0UqmH5Mt+TilRY+ew/iLNrQCq1UdlGNLvsFGuX5KQVL8offM6YKRBwVmxugfB3oH8deRHs
 g6RhZJem4KYUv8aM9LYgg1CtGPgPfV9InL8Rz69CggueOFG5x40q1JFWl2zrcdC9dQPYqFr68Xr
 hq4LzLVf6ar4KxLRFOYB7VqusT4tEFA5YbDEH0dl4sJ5q+NUpkO2mVe2aPQ/Hw26AmbIxGifjmP
 +HW9w/Ryqk0V1M72HUUuojRb4vwHMApMWMOPUhJC0EhMIe3JLnqPEFEULBIBSphQmy++twcIt6b
 3QaBl/N6gioUlTKf8uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310088
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101000-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8785D367046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 2:29 PM, Konrad Dybcio wrote:
>> Drivers for SM8750 video cc had the same issue. It would be nice if new
>> code is being built on top of UPSTREAM code, not downstream.
>> ---
> You're free to contribute to the internal template that these drivers are
> based on

The internal template for upstream code generation is fixed and glymur
still was using older template.

-- 
Thanks,
Taniya Das


