Return-Path: <linux-arm-msm+bounces-91804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNp1FEg+g2kPkQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:40:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC2E5ECE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFAB4300F199
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 12:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83D53F0777;
	Wed,  4 Feb 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYmkGNlA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1ffraHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90319D081
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208789; cv=none; b=P6z7BMzmPfXDRVoCpLq0sSG7W5NkSBysidjxJnnBfKub2Kh+ixK/vtqKs+wCIGN2EYUYLRwb8dY9BVg19FvkFc0tRSZrxMkLTuFZodqqp9PE4WRQFNuvqSlabEL3rfYb6QfxHTvPhpPLKSLRtPNxKFiTKZrzYgjsy1C5z1VOA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208789; c=relaxed/simple;
	bh=PLCdvjacSYDYN3jFLm6YE+6E2dSOam3LzsalzVJemII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goF9zk1HOIcg14k0DP0b/Wv16FMu7l+UE8vLnIdNbotF2j8Pj8iwtWcnroVUifiejmcJdZ5izVTZEIn31+atMiFPItY3/gDY1mHUgbxXVER8l3DN/KesD8bRaCf95Y8mLxSRQblYRDXLyZR6cTfgKVJEQxefV13Xi02DL63eL8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYmkGNlA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1ffraHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIMvA111065
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 12:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR77d+Lv1BtVbkCce3QzypyOlHK6tx8WXPckngFI+A8=; b=MYmkGNlAKgNOx4/W
	SoSi7uDhEcLmWfg93+rzYHlQng+kSoZmZ5EWy2Bp4Tq/VZC73PhUwrt+N8VGhPwO
	qOlnNTLFjrjEcy2hhZRI08GYPKKjoawzj+Cb//OwGqOiQ5bvuraFfu1pSrp29kMu
	By30osulCLFoV9UhXUV+/GsrM6C2pUwYNtOM6J6Z2H0xXc7p5vgCqMbbVhNGGnd1
	Cxa3mS4kDS0pUnmaE4iffEkUzZJtD8/eCcDnZp5gtx3L+L3H7se8u1W0r4XaMffQ
	ACNnjeoeEhc1iyuISpfxY+Z4tZmBZMV+Svre/OVBfaY1M6Udilv+oMmN9Sb51mUx
	IkBHmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjg7tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 12:39:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5034247408dso23084211cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 04:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770208788; x=1770813588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dR77d+Lv1BtVbkCce3QzypyOlHK6tx8WXPckngFI+A8=;
        b=W1ffraHC8YoYQ8jbupcMic8QnaNjIT3m+HjOehJL77VlLCsnxeHpDWWkuNBCPVSXAj
         k5/MC2e2LMY7Fr3TASt1agREbl1euXu4QJBGN1Hdw3NARkUcvVBCbArOMe4Q5ibwLx4B
         sdvB94WeDsSVm4ImbNhlek4TbCKrgbSCNdvDgufcaufPfFQJJKrDNXh7U5KMTbk4ULeS
         qN6kvclFgRcE/jbQls4n/ajgGLsMpHvJWfJ2sKQHnf4GTUOSzTV2tdS+5wBUKZusUkk2
         /mKGxp6/J8IqAYNXgBgu+CRNzj4xtzZ9WbJsiXpAASuaY4YubODkzqFsPtLbflsxsOR7
         3n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770208788; x=1770813588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dR77d+Lv1BtVbkCce3QzypyOlHK6tx8WXPckngFI+A8=;
        b=cwsSq/wsq8OZgG+gFvVJBiYWs7RB9axw2WO1LVJfFNWLF3pJUkJWCqbK5o0WeH3OoO
         zoH5xTpxGW1HgtRkVcX3Mj6yYg8ngpUBcjaKPfgtaFev7QAlAg5LwCRIX3Zo7sfmeJQE
         YK4uXTTIWYS7NCmKwMHezR4sY7DBfTyaXMS1PHUstb+PgU5ms02dvsbGTdNceASzytO1
         u2/bImFkFe0boHrq5GDeJnmODIr5ey3BBT7BAQZ+FYyNsp5x4Hn7BeF5SKgOsfGLzCGW
         pLTo0Cszpu0g3XX1qOw89suKanMMKz7jCW+iVcVqb5DZ3zp3ajvYo4B/pMG7OVLdTHcU
         2mNA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4Xo/ff3Jw6bFL/yEKjOTvjQnU+CuHzMlZ5v1ulz0aXhXfcyreoZWxJ1td/LxJ4Va4hpGbNqUIifXjKLr@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFoOdAtror9PnFaPTgMm8wlC9LO/UIdbjddpreasaI73Po7n7
	as46EkTYfGKecsgXeZMFS9u34gcvUMZOv84nbBY+0FuqkN7VRsyKm8iTJprUfNtUUO8p2GuCbsE
	S303BOHXGxOiHyoxrQJQOME6I/fHo8inLRHBiL4xLm2j2W+/XXmvZ4iRd8IiYyst2UPCB
X-Gm-Gg: AZuq6aJj4fpLZCsvqhSCKfa6S9Hb3eBfIneCiwlYirYXbXl9Ay+0l3ee/+r3f0v9UaI
	b0jTASquG5lfdEc9Yu8KTmq1SVb7xLU0q8kcYGam5wnKBNKV4lpwND1FNS8u+egs6kIdI/AZyNA
	xklRovPwoa0OyvooUvVhTa4+E3raPuyOWYzCTiCWVDWCkWGIGoZRHTgCRct9t4zFOJbwUHRW14n
	hNsNBeC8vm3vjmF0B2wFIrEKSR3at4++9NMlgHqVaJxmwweydLKMT3IhQd96j4ENFJoQIbqwlH5
	ciRDBCZTqTL9sK2FC6b2nLk+c8Cw9DBTO5kl/7XfKkdli3Ei2INGeT1WpWD9wJTFYyTRtGPPnEy
	Va4XdmsKEUeyJAesOdZxPFe/9ttagzVv9xFITTCstSeIYZycN87zZVUebQ3STb6tbn1A=
X-Received: by 2002:a05:622a:1912:b0:501:46db:6b18 with SMTP id d75a77b69052e-5061c0cdecdmr24132161cf.2.1770208787742;
        Wed, 04 Feb 2026 04:39:47 -0800 (PST)
X-Received: by 2002:a05:622a:1912:b0:501:46db:6b18 with SMTP id d75a77b69052e-5061c0cdecdmr24131921cf.2.1770208787273;
        Wed, 04 Feb 2026 04:39:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e38830f3fsm638381e87.99.2026.02.04.04.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:39:46 -0800 (PST)
Message-ID: <f144e9bf-decd-42e8-b87d-d511552ab6e1@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 13:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
 <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
 <20260202134402.ochfxv3lnju3dioa@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202134402.ochfxv3lnju3dioa@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69833e14 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EghoVO_b5IT1oYOY15sA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: q_u70bZeTb9rQfYo0vnG5pPqQEuZmtP9
X-Proofpoint-ORIG-GUID: q_u70bZeTb9rQfYo0vnG5pPqQEuZmtP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5NiBTYWx0ZWRfX9ka13CWLG7ls
 reG/R98Dp3ztvbySVuAinzst+ClVYYJ2MFJoF4cZsfEAsivz5JCOoPHF77Ylaqap64nSwrrM/dB
 u4TU+I5Mp0NFlFdIIwEgdvhBSNcm351MRDjRo1lUv/jWa9sscf9vdAKKTgUviFi3eR9fz5uw/Li
 ljACOQWAopyYd6QWNhoRO4B6ec0jIjyQJ6C/oatRJtXJ581mqG23qNR/BQku2+Ug2aVQ+6Lq7t3
 b7P7VGUhxwXieRzOQAekBc0pn7ZdbM2l9v/Y6CS5LjpLrVh872JLkvn/DhCaNlP/Vb0AdQWf8XT
 VQCMNMiUb+kHV0KskogX/OwtyKLWVQ0E0CdaSXGgENtcMI1xI3uqzr+35wGUfsMNv7IGQyqz/4S
 5sn2/5X1+JBFVMpc69k/LZw0zHwPb5YJg6BmnKnHI04c1H826Xbb8UUiFKVoZuaOh+5TPXxLUZb
 ZnxM1y0useZfurLJKAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91804-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11AC2E5ECE
X-Rspamd-Action: no action

On 2/2/26 2:44 PM, Mukesh Ojha wrote:
> On Sat, Jan 31, 2026 at 10:18:29AM +0200, Dmitry Baryshkov wrote:
>> On Fri, Jan 30, 2026 at 04:14:34PM +0530, Kathiravan Thirumoorthy wrote:
>>> Add the "sram" property to the watchdog device node to enable
>>> retrieval of the system restart reason from IMEM, populated by XBL.
>>> Parse this information in the watchdog driver and update the bootstatus
>>> sysFS if the restart was triggered by a watchdog timeout.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>> Changes in v6:
>>> 	- Update the 'sram' property to point to the SRAM region
>>> Changes in v5:
>>> 	- Rename the property 'qcom,imem' to 'sram'
>>> Changes in v4:
>>> 	- New patch
>>> ---
>>>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> I have a few more cookies (stored in a fixed IMEM location supported
> downstream) that I want to add, and they are available on all Qualcomm
> mobile SoCs. Should it be added under SMEM now?

FWIW currently they won't be probed (if you wanted to give them a compatible
string and bind a driver based on that), since drivers/misc/sram.c lacks an
of_platform_populate(), but that's trivial to change

I think getting agreement on dt-bindings may be the tougher part..

Are the cookies you want to use attached to any other part of the hardware
(e.g. in case of pil-info it's directly connected to the rprocs), or are
they general debug information?

Konrad

