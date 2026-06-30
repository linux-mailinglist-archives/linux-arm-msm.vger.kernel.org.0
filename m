Return-Path: <linux-arm-msm+bounces-115429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ffK+HBW+Q2oSgQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:01:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126E6E48DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:01:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ST/5qwuL";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E9dL3CuZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115429-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115429-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C52630B5A5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3A640DFBD;
	Tue, 30 Jun 2026 12:53:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DBF3F39E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:53:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824039; cv=none; b=LOOpcGyfFCsH1DBKbspdgyP37oS3b4OH3rLR05ebVjxPBQBUJqlv7yhK2msGjlRWtmbOxSuPZRhSTNluAzzrLBE6wNcIhriIzzc/C1GgQLOmm+cbvHGWcwTsHZCaRK0r5agyouh+gbD6HqzAUX0Gw9QkaqoST3NPViGXzL7sEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824039; c=relaxed/simple;
	bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/yxLctwPApnJQJy7bsPQIF+2h+urin0Cq6rC23ln+tk4mzydQkNaDGOkYs5xGOlskyiQCISLSO45ylIARfVGaAF5Jj0fWAm4LAuclC1+ask/GD9ktyl6+al3M8JTKKzenJlUQOCxtNUA7on034zQoMsOPbo7gEFMDYZBdqLAOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST/5qwuL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9dL3CuZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nEkS1590709
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=; b=ST/5qwuLvYI61b2L
	UpVjJrRP+JQ5Y9H37FKkLLWmlCpJi79TR+4KctE6ShYDfIf5Ir5D78/ge2SUogEz
	zX/JPYOcsmGYVv+pzIhohF3p13DN2WMYDxsKpuiyzulfLy8ese4xPbqCwsfGXc6L
	GnqBCZ8SHuPg+EneWuHe9iChqRzjQA+hO2zson4PvJm64h6LBKL0Pn75jSuDiihx
	xLgeNKDoeX8+n//BoYePRYoF+cUeFUsGiKfaT2PJKHMg5ca/s2cyNbWckIGTH6Oo
	O0Ti2NIVZ0Q0XghZ2xUccljMx2FMDoIPLw/yI0zVvlfmV3BNGYZ+OxlLIsBcI57M
	mHmjjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3m5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:53:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1857417aso214891cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824036; x=1783428836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
        b=E9dL3CuZLUlXLueCA99Gfqkf6vNj8Nloj/NVSWX34WaLH9QX8RmGao0eLlsqACYayL
         IyiTmUQbwG/djCJLUe4UCxvV/XzwNXDqRBDfL+pbQ2K/fZV5/WOJ0L0L8NwyX1Cyobcv
         4dMoQelDJT5nM41MamSIQB9X0rIqE909gDp8rQMTKMO1VpETB3F9LBXEcZ+IZKc/hQ08
         7869U3mZ+1IELRAOcVUJGPoQv0GVggCyFrm2rH9krnQ3H207KUR8NodMAjMJdOngoV9t
         pwQeV1195O9ADdB4WQNtc4D5OHzT3GswfMx+9RsTgPmiw7konspEqK9k+rrRpKpPcQ1n
         muDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824036; x=1783428836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
        b=gPn1Jq45bdtvnBRRvLxb6m5cfNtiWow2QH+7d7Q+5Dj+L+HsY4wwkoYtaSmP9trudW
         68QxX9Ys16psTzdKN6n6UdaNDwUM0i37uiu+LL4JD3jw/vf8useeLkwEzotXRxg+1vDR
         qHspZjBzYNqg3Luk9Tw9SyNqtQatk9159vJs8jEGzs9vbxh10146iucyyOU9sLQUb4K8
         3AP5WKdGChfbE0QnrZ65tpapNmfQibIq3yupu5qUWxe4V2KT2PtI7eUZFPjeC3QGnXbv
         akH8gT45TyTWBZGEta7xb1cCYK8I8G5OfQ2ulzETb4yrXy85uz+Rgjd/CpLLtEUl8H6f
         6cLw==
X-Gm-Message-State: AOJu0YxcYeqLl2KYhTVOMEBn5oT89SWoz96XH7EJgHDPlQCWRjL4xnii
	V5ZsDEjXV+znxathOyA+ZTmH4zbhucw4DY0yVcXEEMvNcRiDm8+kGnG17dcHlKDoO7wHXpOcuAK
	qCy8fslojMFCgbLEnuGQz+/pD4mbtNvoJHfhSDovt78AkxP5VzaMtntyMSFQxeXF85tKB
X-Gm-Gg: AfdE7cmtRBEFIMnd9cg/H9GpqaHcrXF36OabYBCa8jQJkFg/hJ1kEhomtBiztgi6AW8
	evc9/EQvzuQgAozzmal6ycIKghML/Y+Ib5czEOD1JtHLH22Q8kuud7IdBgmdEs+WCIOqUKFPVD6
	lVZJo/bCLbN8UsZq8Kc9ZQuis28G89n84m4HExn0zoYVC6Q0hIgoAGQ+JbXmVd1MFFUiTzWuPuZ
	wjOy2DDemniPNuPxgmar+CsRvpHLk4VhcWJjJK0dqNpP9w+ZdyIgTJ8HtNTXAxOesvZS5ywK38r
	At+sjuZFZ7rb9EujGl8WsKs0722HElL22wi3KvR0Y3ILNlNnlf48fWxwlAkKLWDwxOxnyuwE6OK
	gIQ3H7YH6dVsEssGqtJ6X9BHS/+gIJM96pYk=
X-Received: by 2002:a05:622a:120f:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c10894a12mr32761291cf.8.1782824036441;
        Tue, 30 Jun 2026 05:53:56 -0700 (PDT)
X-Received: by 2002:a05:622a:120f:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c10894a12mr32760741cf.8.1782824035970;
        Tue, 30 Jun 2026 05:53:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm121297366b.3.2026.06.30.05.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:53:55 -0700 (PDT)
Message-ID: <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:53:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX6fflTwgYMu2B
 4ziIHbRY6j95o1zPgyNiTlaZ6k/N8cqOVwhfDAOxBO7dnbpJII3q7lzIFMutuVpxFQC4xtJS63m
 CwXx/ehrgkI6ak1IHBoJJFMZLse39b4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX0al6MXXIAzE1
 zMdWbsl7DRKkE5iLL1StMcy/Se0AlWEO411dW5RDZToBORr9I41uNhWoRBPPzrQ286CHasoPc87
 NfLlKfOr6gnlfbrMu4lWYohM4MUev9lSo3Q+iO6EIhRpGOzNpso41bcuNsxbOOZk7u0tfCbh57g
 sUF1IdPHj5Fg7jrsrwfC1caLleQv2JT/bqG5KnQ/uBXLM7scG2Rcx4R7ou/Ejpx2MFPGI94h5cs
 lZZAfV8i3gebOr0f13sOgs2iWTlokWOItQJKWmxjwVDdIkCrhKW+yiNP7CqFgsA9Ybsr7mJLo26
 QFHmocZN/YJsMtu8uCT6AFDZ+ScP9W3WBP02nC4RWlkpkkrcR59Ieb0Katf523TsIG4i1AdcpbG
 3U5eSYWn/0e6TTfxlpnrj6rEbfmWw7qkhstD/LL2U8/bROMdl56slXBdQxBgNZotu/va0T+CVpn
 93ZQXJ4bz1JxXx6nOWw==
X-Proofpoint-ORIG-GUID: 4wlc-141ZRGDM46EVQ24aJsEBf6NeXET
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43bc65 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=keZN38YVYYl-MFWHEpsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4wlc-141ZRGDM46EVQ24aJsEBf6NeXET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115429-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2126E6E48DD

On 6/30/26 12:36 PM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. The AMBA peripheral
> ID probing fails on this platform, so the device never probes.

An interested reader would immediately expect an answer to why that's
the case

> Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
> Dropping "arm,primecell" makes the device probe through the platform
> driver instead of the AMBA bus, which resolves the probe failure while
> keeping it an Aggregator TNOC that retains ATID functionality.

This describes OS behavior. Move your message towards the other
compatible not depending on reading that ID register.

Konrad

