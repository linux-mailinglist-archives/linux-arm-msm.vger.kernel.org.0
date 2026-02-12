Return-Path: <linux-arm-msm+bounces-92682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APSgJIe6jWl96AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:33:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE712D08C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE14C303A90D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD642C08B0;
	Thu, 12 Feb 2026 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jK0Fnabd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foUF82lN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD411A58D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896003; cv=none; b=PKWr1CU9smzDEH95FDYehGuIkmEa4oFIl2Qi7s66I4wqHAvf3SoL598634jsiL0+HrGR5BKR+nW17rIcdGBQUMBZDg3yvUrJ+UezhLIg5toOKFqueAh2OdD71n7VSQtUGo8cNkfIWoCjr1xXJFQ8NwWz66Y/SukPYo051ak0QrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896003; c=relaxed/simple;
	bh=gtxIjWMpJmshU2geYi+EfFRTCCDtUZrC0E3tqefg1ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqMm1w0o2/vKsjgrUVu3JHJzVZ6DZY7z1lQsnpV9nXFAonrreyMitwatRjj23qu4rt68kbj27el/3j+/W54C1CkAH/nlBjTcnqQTJFtoGtjfpr0wIqWdYQlr4iUEW5rNz3Y81EPGQRZmAF1XdTv/momxftuCyEBVhAvBj4DjThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jK0Fnabd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foUF82lN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAbhc13887834
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtxIjWMpJmshU2geYi+EfFRTCCDtUZrC0E3tqefg1ag=; b=jK0Fnabd33zpyw/D
	CLtLKGyxRNhNkZLS5RKgO88YQYMhDBBl3oqGOMmbHxpQ48oaASVltXS519s+xChs
	FgWAcq0bSsv69iyxdOXi7UWGK2uiILJumKXZvweEYq3W6v9MAofpMlqRcnk/be/j
	4lWCRLJ8RTBI7/teHsIAP3/xgE8jKoTzyzjEVCQb3dPPjamS4CzjfNmFCTBoKhvP
	yg80hY5xhkmp1PvAxjGRkSW6ABsknegrkhkecVvpTMTo2ak9uOwFovpL9U/p+xR6
	rcqaLedSGnN66w6dBH9ikfdH68h+OEs08574sUm3c7l7D7gTbmvYVcmChH5gf0sz
	uFp6zA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wjada4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:33:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89496f5086dso28455456d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770896001; x=1771500801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtxIjWMpJmshU2geYi+EfFRTCCDtUZrC0E3tqefg1ag=;
        b=foUF82lN1ltezrovGjgSZ+uOv6Kao9lTc+xXjagQFqfb0Lws1xfe9DoZPcV+sPhH0T
         9NMCG172ekqOxCs32HwtKOm1wqszOZNiaeUeDveHhfDB0sM37kWa6lw46HAhC2PjQ0Zo
         AuUz/GgGlk+35so4Dk32w1mQxQWfUPYpe29uW7amLkQ0scPSO8qpEkrnagRVYZxkeOck
         1mRWCySUlexf4Og2oImTxIJqjwN4tl6myh0eS38RFi5wK6Rp5XI5/V8PwlFDS/en+Tb0
         i7jxZrKSmreEUZFf2RHnkGto+OIiwDluLle85cJ5HV4X3W1QKp0+u99Cu+ToLJdJvgVl
         6a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896001; x=1771500801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtxIjWMpJmshU2geYi+EfFRTCCDtUZrC0E3tqefg1ag=;
        b=dwp2qdQd+exbpNFh2grL5ekTsCUPXXEE2jXRdRGa670IHj9Y2H3KorsCn4BxR+5s8u
         ZOYwQWxmtu1TMLUzxtGYl4YnkKNnRad0CgMH4gurnIL27KiAVzegpK/enok705sHhaEB
         r8gIgoGDn1T8AKrVPOlTfDHChiHEG3rItJKu538BgMOMMEc72SIR43Er0xEDfy7t9bS7
         W71bRWBpEgv6RKohApr5piuhCh4uURZxl/qMGHJRg+wSJOTNaFl+JuEmlTrkjCbSqvLp
         oCw9bE36jOKZXIRrJGvngb/281rfZ98lKNkSV5xO+jubgAYbETl+dvQk6Tvi54tRlKGz
         P7KA==
X-Gm-Message-State: AOJu0YyDmgrNCo1Ka+EKNbkJlz0TazcwDDnQ0sfQnmr2/sl+np5fuWuM
	RvA2RJVcA0QLewrcyeycA3ugeUrT/q8SABZXRpuAXe7kH8hmiLtodYDh3KtW6ALN+lWMThJdLpt
	a4DF7e+l7ttDHJYUVHyRyrrD+dotb9Bp372zMnxm9mmHpDjl22Lu9J3diKIfGSTHR5zNal0tWyG
	Fz
X-Gm-Gg: AZuq6aKZ2GOmgB4PZD2cnRstF71PFH0pziQqphNiK/hvQJOhW6q6NG5/Yt3FD+wFCjK
	REhhjdI8H4JBO4/dOuo2TO6mJ4eAZKWo802oQpOlSCUhYRE7rBVFvlbMKhEjhd6M0Z/zzIYP5D6
	yFWTWgCYH8FZtMnlv15L1wSORt+8jswI3MOZNILYKEX/3WidKgCB6JODD4miUsLkssIM4pjxl26
	dtXRlAluHknN0HN/PWjt2+CS9RCjujxcDu5hOiXJMeCYqDSsx3XEM5BJni+k9O91Fzk+GGAwqXW
	ASJjjnFVM7rKAh34m9CpQdksF7suTRiUStuFmP5nUfNngJJ35Pb3P7YmWfmnlbFwpLzB7qWSPmw
	wGdlVlylwJya2N88Bgr2K9BGmlB0KFqbjjeHr9ZU6re0BsVNqSaVpI/xeZ0XQeZtI+6Dgmfdr3f
	6TxHg=
X-Received: by 2002:a05:6214:5c89:b0:896:fc89:b21a with SMTP id 6a1803df08f44-89727aaff8fmr22027416d6.4.1770896000944;
        Thu, 12 Feb 2026 03:33:20 -0800 (PST)
X-Received: by 2002:a05:6214:5c89:b0:896:fc89:b21a with SMTP id 6a1803df08f44-89727aaff8fmr22027176d6.4.1770896000466;
        Thu, 12 Feb 2026 03:33:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38caasm1583962a12.17.2026.02.12.03.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:33:19 -0800 (PST)
Message-ID: <d7a6c220-a6ff-4cf3-8c05-762785a7f21e@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 12:33:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Configure USB1 as
 peripheral and USB0 as host
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
References: <20260210152548.769951-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210152548.769951-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698dba82 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=zJCDIgS7Kno-m6qslm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4NiBTYWx0ZWRfX1F/PLQZ0c44u
 P3KPh1dzZqAbGarHof7EFonlHnLkxli/jWmRclj+QzLq5v4fN0ggyKhTYRTjpb2eBgmW2p0hqPd
 WlpPYT7Kl5Eykjshx0da4nsf+YZrskoIiavfuRaagofJLQJTXpDKgKKy8BMvArAPVJh+wNmrJ9w
 5m6ivUAKQN53YSGltetPvlMDL8hH8uzKwLoDy2yaiuuF2UOpxXsnWGFjrvWgXIa0xKhZZUlOTRs
 t14a8QypPa3pkpdQlWug96MavVH75sKu7zDXiIlgYjiVct2mvwaD63J5yPxMn9PhHgsCfK5oGk1
 6OihJCD5Z2y2kHEn7iZWAQZddx8qK7CPMrrBaVriJsSsX/iVLomvs6QAS+Q8qrkeH/JZdnuyqMX
 2R2jY6kGn+3oXoWNEd7ECsARwb25RO6FWceB99vYp/8U4kQ6xn4GUwHgeYZ3ckMpgH40fkBwYo9
 AWYcO12GRTfraxmDJ9Q==
X-Proofpoint-ORIG-GUID: tqFUSim5_hhfv4sIEN1OS3Ro8ibkzIKi
X-Proofpoint-GUID: tqFUSim5_hhfv4sIEN1OS3Ro8ibkzIKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92682-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCDE712D08C
X-Rspamd-Action: no action

On 2/10/26 4:25 PM, Loic Poulain wrote:
> On the monaco‑evk, USB1/HS is routed to the micro‑USB connector labeled
> ADB/JUSB2. Enables that port and configures it in peripheral mode, as
> expected for ADB/debug usage.

Is there no OTG pin routed from that connector?

> USB0/SS+HS is also repurposed into Host mode so that external peripherals
> can be connected to the monaco‑evk, allowing it to function as a proper
> SBC (e.g with USB/HID devices connected).

What is it routed to? The DT lacks any topology description

Konrad

