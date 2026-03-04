Return-Path: <linux-arm-msm+bounces-95293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI7pLWwVqGnUngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:20:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 613BC1FEDDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDB14300C036
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D3A37F751;
	Wed,  4 Mar 2026 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU4rpbS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEzyUQaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E6B4964F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623209; cv=none; b=hby4rBYQ8GvXfbnHiTk0PV3xVs+EJmtna0ACu3b2iC/VsCv8S4TWvT5EXjwXe6igaVBySuPpyjhl2Nj3EyzJxo6WvgR6Cq6+tlkN239ucIjoKl3t4pCDH13b+t/gYn06ZluSTTqck1qCiNP3NpTnHzM7Pk4TERP143QLQsgn1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623209; c=relaxed/simple;
	bh=mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+oK4LdMq2VpdEt/yqJkSeJo2txVAfJ2pd4AcwPz5epjQ6iXFaRwov3f6xkO55oMiq8C6xGnmceQkJvsz/niXxGOdsZBvlocxO9bSnplhu+dsZxeML4q7IfFv2O46CcahvRa8lzzZJpCKWkpS6fb/2U+iggTBQMbZc03FtByqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU4rpbS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEzyUQaP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T8le1073670
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 11:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=; b=mU4rpbS9fbhtYnmd
	2+LsjKBlWhmaS+ZXZyzbuKPjCMGvb1W3yeLlvlNRsJlXEAiRpSqqZorzfZOjEVs7
	vodTLAdxIeUegobW3vYk8BOCoNFAsrSHtf+fg5rTWl5eCtwe9+V6RTMmpDypBQ02
	uY8d3bedMe6ZwnUobmtQQCv9UXW/mYTz0aVNtfntNyqumIiXs9hlX4A/nuZmJD+3
	TDadDsU5KUD20ngTWBPlYSJCnUiWH95K+n6sg4K2vVfj8oOEKNRSMkSl+UjzMBvf
	D6HdNWuWYztDTyzeawf83Ea6T/MTTDWVTmKreyRX0+H39h/2CY7v1+I986XjtbX4
	/oIv9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfhej5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:20:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a081737bbso12606436d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772623206; x=1773228006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=;
        b=aEzyUQaPGame5/gAUDqlSq+Dp0WwsKOUnDsAWULpBX7COMMha2iScv+IZ5rroOwWEn
         yZ9QyxTFI8Q2/5UOc600g6ca73Mrqgr6dzeNLHmJ9ySsbCmUUTMdNqfD3LMjo/grkk1d
         tZo+FRbN7vFVCcECymsyGuMPYXYvqTbqHn3SK7WbwT89vnbjxPCYLAn30a0tyenqA+SH
         +yo+fW8bysDOfLCGha/3K97SEVFWVfJzT2Sa0DChEMlArDzi/M1LLY954oPRYyOxlVxK
         XRIxbH7NYI0Q/PLUhOCXpJVsyB/NKN6Q4JiQnDYvsyvjFdHsW3ToDGIqdyzZ4Z34yPmI
         tNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623206; x=1773228006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKaH8Qy7gLqqs8O0dRzJpiEXsb6oqzMNQeYF/Te1EUI=;
        b=nTyz220Yqzww7MLfUOKueLreuJXqtTBmPXtV9NeCHF7oUDlKqL88omPvQn2SwCTgiK
         DGRXE6vhQBxNOHbBXu3MKwPMw8g3bKGi6mHHJZvQnW2sByn0zhylBTuYp2HrQ3bE2Anp
         UVBK4ifgTgADadTABvXIRh9VCn1DtuiGlSZmYS8LfktW8T+BWtEFlrSAIMYl3EmaIfQX
         mk2S9abhNPKn2iq76T7QBdgVevOK6y2rdLT9j/iYthB0eWUr9NyuV8iqOH6bVUoVblcS
         ksaQp9aKjySN3pdd2SiO+dtiFtViEIRxhe4QAIV+t8tE7L3qfzbqyqvuXpGebKR4v1KZ
         u4dQ==
X-Gm-Message-State: AOJu0YzNzX3T1optyDmbFiqt6vAghkAu2oiCIVCvC1Zm7JkjZnBrS+vD
	TS6lLY8c11FUcuzelxjYZP9NRI2IWzlrTGXG/wXYuXOWaYSMbg8Csnd1tt3R/su+3zo+Zd9VpVi
	ySHN9W+V0LI3LsaPjof98E1XCvzzwKieaYiiYZVJbA3fNp2c7QAej/4yj6yCvyCDrRg/q
X-Gm-Gg: ATEYQzwT1CyQesAmjAJytbLNDQgfkv6AwvGtyDFftaJ7c6jEAlzXXOWkLpbutlIGcom
	CEOPbxYiXH+sJGYRoZFq5oBpmI1V4ARXVNx6WqXcRKSZouLU5+aZsuhR87iuxyk6O2Y3Ur0Ztza
	imiALsT375X+CB2Q9IHTJkZgJ8DJsxAGSGf7DVEgEywiTXsbLiUMu0jXaq3UbX1Xr8y9Fu/VRPL
	EFRb7YowLza4pRcgPUrzpwI6RwLe0KpZCSswaoREdZS61rR5PGR0dI+QN0MM+ROT3pNRCfbCVcB
	5GTQP1U9WX3lB6Ijb64yInAh1hwIdSF1aQm8tl+MXSJ02pk4Y/gAJYQZC6s7LyWSjuStBL/QdeC
	S9uWc19uFbOM5bJAijgSzPNlqZo+LYNLcbobpfqEwKeppKSoRqOAaayV6UQ3f1BB9LP7vdvoNsJ
	/plWw=
X-Received: by 2002:a05:6214:6015:b0:89a:14c2:b7de with SMTP id 6a1803df08f44-89a195cf8c3mr13291886d6.0.1772623206515;
        Wed, 04 Mar 2026 03:20:06 -0800 (PST)
X-Received: by 2002:a05:6214:6015:b0:89a:14c2:b7de with SMTP id 6a1803df08f44-89a195cf8c3mr13291566d6.0.1772623205976;
        Wed, 04 Mar 2026 03:20:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae8fee1sm729947666b.45.2026.03.04.03.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:20:05 -0800 (PST)
Message-ID: <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 12:20:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303150152.90685-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dAzBjotLDBy5lDwufSYyMZeDXgD8Js0I
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a81567 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dqsZej8vO5kNzgafIXIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4OSBTYWx0ZWRfX2lNGtRiM9VOS
 B2EpYCluTYWzDwxTc5kbKsJvXKBtj9vlWjANnbaXstGbtcYimSnCjZ/JnPyXr96dx6BCio/eKoM
 rK+UlRHzrWwjJqMcRsucWBEfclLlCGGs3V033D9z5xCpaeISfqrL9GWOu4CQyIVSBiXpuPj35lY
 taOeu+vczubjZA8lGn796prWulqq+vR/Upy5b4gdTkLWp5wfUZEx7VmQZnmeQ7WPOOjPpfJbpV1
 rujxQ++27+c4Xj/mOHNPfDzp+6Z42n96xolcM3CLjHatikrMZR6rJ6LMk/Y4HWWcTHE+qff/NCf
 pAHFVyZdSk/XFu738B2LZBnHP4RILTdjM6YOmO/ulO/CL0prtzbklHxNuhcdAGHyeVLqJ/10GHP
 bNm7d7BkF19Bpof5Qyb6Bpkxx3+QzTOLRisvf307eO9W67rO/Tk52sfB80u6aLwG8DBaMZNIUU7
 iRV3QaA/3pEnYFYqsWA==
X-Proofpoint-GUID: dAzBjotLDBy5lDwufSYyMZeDXgD8Js0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040089
X-Rspamd-Queue-Id: 613BC1FEDDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-95293-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 4:01 PM, Pengyu Luo wrote:
> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> Gaokun3, the image will stuck at grey for seconds until msm takes
> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.

Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?

The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
node, so if you're unlucky with timing, this is ""expected behavior""

Konrad

