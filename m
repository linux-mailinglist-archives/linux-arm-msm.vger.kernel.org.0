Return-Path: <linux-arm-msm+bounces-105651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Nf0F8ZP+GmQsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:50:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE01F4B9A42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62223300AC14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 07:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D278430FC1D;
	Mon,  4 May 2026 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9yiRMvW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoD9qwwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6E30F7FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880999; cv=none; b=ORJlL0pc4T5dWbUpS4fmtYMOa7PhPp/B0nHbxzyEg1BJ3RyPb79uu8vT5bjb8AOhjdwYKpkEs43fSWNEON+1kCnQyha44L+WEA8qzDvA4EiuCFIsHlmpuIDVcEND0rAmr7MDytd6TDNOefAgyZp9IOQd2YoHH4d9xxPD4vUcTx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880999; c=relaxed/simple;
	bh=SElx5b2Uv2Uq3Kx/daZlZ34Qx2PdFEIF5/ByNktxkYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRepXaxe6zESHGbG4flwtTsMASd9IVbSApPnO+N57ualsPuasXXpA1DhejP5w4Ko4aZuBuMcnUeHXGVAbPN/tM9No4icVID7h5UXTGa9QeAENmG3fwyJvgAGoWuJCrA4z/1Y0zRXnPYMkQFgM+vwznCEi5TzRfdeawka1cQc9xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9yiRMvW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoD9qwwg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DwaA3506352
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 07:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/XzZJooUebWtMj06qJXGTSFYA8rmAmpWx8ruXtFCL8=; b=h9yiRMvWUDnL+9Bm
	ZukPgaI357ri/Ge89D/OSrEPTrvwUXJglfL8cZcS6ARFQp7l8Nfcg0l3b8kfEMa9
	i4Lt6clKM414CrOPrFCFHjotNhngLj0bvqJIuxO3CFOx2cHhnBzCfMFtwMIZD+SW
	Ib9k09c3ghxd+RN2gZWCVUu/oR2q8NtDC1gSJ1k8ZsHFMPfPy10MpEtpYB80QDC2
	jMnlvZ7PVJN50mMj6ggGdRZwzx2mH0IPxHmKIiPD9jqk9ryVrk2KCF4qo4DiUkjE
	rDCxihYDr2c3eOSbexmwrbMuZ1iTv0HAe45m5dSTBzb9lAeVS7lIfqUeCKgolDE6
	8tPfnA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfd45d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:49:57 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so309165e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 00:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880997; x=1778485797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/XzZJooUebWtMj06qJXGTSFYA8rmAmpWx8ruXtFCL8=;
        b=IoD9qwwgZRWb3dTG1BaZOoQDOqDVUeA0X8G2yA2LKo7LZLz2aYOIe5dJcpeyPOkahS
         rcvFkdXo+Vfg65bhrL/NbrVoOz2Y69l2UUD4/g0XW8mYH6cD27OKDWVPHBxA71gfx46C
         Q1uQmjoL/9BPRI4mtp3m5YbtTXtbq/eTm/OhCyJkwScZ+Rs//xCE/EBDYWrmzQplUDGR
         2VyUd+NLWRK5dxzi3BxsDDYSfpBwK2x73w7+sdZDjcLIMocujyFYNXWTPPx1L3bsZ7Rf
         9SkoE48ZBQIqkNjOBG6AKpA7k38AF0XNVhTE7I56u0k7k4DduHiACu6x81dOrKxbK+sq
         wr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880997; x=1778485797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/XzZJooUebWtMj06qJXGTSFYA8rmAmpWx8ruXtFCL8=;
        b=sCM9DKJsbN74yDMK0BRkBhd6ZCJzXwP8Vl2QLgT7OvHVyYhfaMOwvTuaz4SJyWYmvv
         cSJ4pPzS44QFDmhyA7cCkYEQlQPEKuMdA0XD1P4y1Tc38GiIeHbPYIPWxUybCGRR9p90
         KCtKZRyuOYNS2fzHVTpp8xoTf2Kwsm4zwjGny54ZNBcnM81HMbPeVo1Ro7eozFChpVrG
         WW/QWlPO4wQwp38U9xzo6JrskD6aRvHgTpSZnjD6qgE04sxViRj/yd/4U6ymLQyICeMX
         0Kd6SfzwlowzxwegZ/I4FhLtH7Vfgfl9xOOk4WfXZrtxpBFXPBpAtNz51Z/ix4l7sisM
         1vkg==
X-Forwarded-Encrypted: i=1; AFNElJ9FL3B5QLA0Hl89CkDUBwG0XDsXWHYNKCVqCdlxX64zwC1zqWO5j7eQybMb71KPFh9tk8Rp0aZr6kZJmP8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsdC/LSOLypFlKcGQyMXkiOkNYjL8Lgn5WDLMW90Y0DTUxvOP
	8qFCZxFOU9URhfoolikZiT25zWJocBQ6WNko6u6rKOBzqbXeF4yxcdqHcj5LEoeQ9mQvhtpNrt0
	yropFaZfRaR1fRVGiE7/5uOx6ulGTa2qDQZ+TbYRBU4z2zHBnASiG7w0PSAbAOs95FN0W
X-Gm-Gg: AeBDiesjVRIbUkP9yOn+Cs8MmU8rDFPwM2+4ZsvRB+50jc0WjgQALBj5bsN1RF6dBK1
	asljDAiRQSnJC/AskcPLDM5q3XpCjVtd3PbqqgusGRO9fEGIbprqBrnu+SskxAKSq9aaruAp5Z4
	5ngzM1Badc4MOuCLIEZhZO5VABWiWKzlVjXW9lxtlrVJzDzU4g7shDeUjxBEixmJl7Hme2j2mLs
	+3Roa7nYgIWEuiJ4FzmwfJCbJfegb0/k9gbXCkHUxdl3J1MLjqPsF7q17PnYqRLMikQsAKayLdO
	egkV1W+F1cmXailDNUMon0RbNirrEwnUCYivHpq5dyx1AVUlP/xeCMlYtTxH8qSFdT9y83l8zi+
	SYY6WC0zGnWOnNt5kr4SDt+lruZfsBf7brhMPCgobq5fdTB1sbP2S7QeyFzU44qfjcPM/poHQNa
	MTgIucVAYF//0kKA==
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr472376e0c.1.1777880996779;
        Mon, 04 May 2026 00:49:56 -0700 (PDT)
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr472370e0c.1.1777880996354;
        Mon, 04 May 2026 00:49:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc21478931dsm90603166b.24.2026.05.04.00.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:49:55 -0700 (PDT)
Message-ID: <d58b8c6a-c837-4bec-8ffb-dd9d7b12906b@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:49:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [7.1-rc1 BUG] System hang when reading clock controller sysfs
 'registers' files
To: Daniel J Blueman <daniel@quora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -2qpFlKJNop3JxbZ-zO1K6pDDodm7kgc
X-Proofpoint-GUID: -2qpFlKJNop3JxbZ-zO1K6pDDodm7kgc
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f84fa5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=la654yHik8Jaich8hRMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MyBTYWx0ZWRfX9zElmM/t4tOs
 l1+NtAvEcH7yy6izcefiquYsDEOTtrUDOU9CA8BQ+99R5+/XCvmih6V96FdpzRa+aKzWoaHhJec
 avehweo6cS84YV4330Rx/j5N+R3cN/OAV+t4aez+S2W+0kJxA+dhcvKM+uYMJmS/pC0KGYIJ3oH
 aV3meUJYk3Pcf8tn3xWMF8kZJMj+yIVkaFxpX3wSa8q995sthgPC7wVkBXNRpT4wAqBbucfcmjw
 Cu/xvnc8XQNGoPh7f3Ao42TxygWQPg0/Nkpwyd7fpOAI6KvQXViKoJT5lvJ0qxZNlAYbyC1lVKR
 a74p6vQqwtf6bjOVuUXJPn0CxzZZS76KvHDRrZQNG6MiWvIZOHfehEvoJF99c+DrAoujfDaoaSc
 UqWYhNoZqRmXg1fklZiXqJ4LcRvYWKWDYfJokLEaUjdnXHgreLZyhSf8nA/KutQWUpl6NoP7Hrg
 +H3KoxZuIx2gTQq4mHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040083
X-Rspamd-Queue-Id: DE01F4B9A42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105651-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/2/26 8:40 AM, Daniel J Blueman wrote:
> On a Qualcomm X1 Hamoa-based Lenovo Slim7x with upstream 7.1-rc1, when
> reading any of the /sys/kernel/debug/regmap/*clock*/registers files
> [1] (which could happen inadvertently with grep), we see a complete
> and immediate system hang.
> 
> If this relates to clock/power gating, it could be avoided by
> inhibiting that prior to the read. It also reproduces when booted with
> "clk_ignore_unused pd_ignore_unused".

Does this attempt to read the entire regmap-ped address space of the
device?

If so, that's probably ""intended"", since there are TZ-only (and other
forms of secure) registers sprinkled throughout the range

Konrad

> 
> Thanks,
>   Dan
> 
> -- [1]
> 
> /sys/kernel/debug/regmap/100000.clock-controller/registers
> /sys/kernel/debug/regmap/1fc0000.clock-controller/registers
> /sys/kernel/debug/regmap/3d90000.clock-controller/registers
> /sys/kernel/debug/regmap/6b6c000.clock-controller-lpass-audio-csr/registers
> /sys/kernel/debug/regmap/6ea0000.clock-controller-lpass-tcsr/registers
> /sys/kernel/debug/regmap/aaf0000.clock-controller/registers
> /sys/kernel/debug/regmap/af00000.clock-controller/registers
> /sys/kernel/debug/regmap/dummy-clock-controller@0x0000000001fc0000/registers
> --
> Daniel J Blueman

