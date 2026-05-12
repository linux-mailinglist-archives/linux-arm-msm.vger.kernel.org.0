Return-Path: <linux-arm-msm+bounces-107055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G7mIpPsAmryygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:02:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED151D330
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F18630C5F6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2533E39E190;
	Tue, 12 May 2026 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSd8d3XW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yw+eNS51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340639D6F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576097; cv=none; b=gvnlqPQ6WvZhtdIlJE5dMoeelxMbmd6FD1EaNqr/Qvy1wxtQIezjk/uY+a8sOX29Ac3H8AkBS7mtDMkeVK9mA/Lg/LFXrmExe9lCyaS9OVaPVq+nOe0METjAoOQ9IZheEuK9ld6A71xgnStxGKqPH8CBoN/Ocl/o9ODOd+1g1Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576097; c=relaxed/simple;
	bh=52Rtq3B3yetltmJYg/Jq6+ugsiX1P1VtCrsFWLjGCbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQ94RWOGWA6aO4REII2xUY67CZnQo50C2GrKeHtv8qQGOdy15HGajUECiCrWDyGV/uSFRK/BoZIb5UPbcdE6ub3COAzYWtYXiMzI3AUcTjAnRxPNC9JBcUJSfkJm0OVhphsNsj8Lpteuzae/6pn2JOYRghJ17PMtqB/ABgt+b1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSd8d3XW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yw+eNS51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4TFvk1183964
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=; b=cSd8d3XWV6tPTnyY
	qeTlceQh9goZb/iweKamnT/yd5ZL0n3jZjYDEVbDg+Bqisdqp6/ktzd4zptsR7WX
	qMkF9ozCfzf/cb4QZtOOHkdiF8dF8R16kkALmwlc3e619hoHn+5qDFGWKx9vUKMN
	urEVDYVttdIUygxhT8Upp6DnvBFUNSBQSJfzSq4zKBzLpuXfOjLSMp2LZUAD6n/j
	D4FiygpORscdB312IbtEv6E/WC5HfsUPsDDmczybY45dHabjruXH0BLdx+6PV4BF
	MqLovMg3JFYnIqemGD6vZRNthdf8/LrXQWPxY6IIxrBgUSMeuWRN3t9BmOfRvEBe
	vs8DRQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyab27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:54:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso3402847b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576085; x=1779180885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
        b=Yw+eNS51kPwcogkkB4EZECO9AYbUgYoHJq/tbEKSxqWK5Po+SK2S4YLKgcRg064D37
         PfPSlNHuTAEuYTCtXwxwiaMkfsACcitFZ2AsFhoq+6BY31QgQoX85AdzoPJq+JXqA4oB
         JCxMvwEg26Y0g4MlMs3nuk5VkQZckjDv19RPYrBccjfd8KGc23wouYyQv0b1VbtrCMzn
         urCTmOxYOXQYIPKagsHC3m/rWbRt/nixHxXPflnZkZHpoj9j7nCxSgkHVgaSasPcLcM5
         RoFJEJZo5YAkvXvfyi54ICLWCLSkiukbg25T7wKoZ7/4SxZeuU+R8Vpt0s4azp42V6tr
         3DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576085; x=1779180885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
        b=N4MwGrsgMkYH4Mrb7vJJl/pjE8avyorhUT0blS2hrRxdZm+CZVbc7Dh0C5y2M8bqn0
         WW+LfIVAeNtkB/g4VoKh6RHt49otFH2hYvg2+MUrvvfyAL61CH72RAUiBw1Y6Xq7JeHR
         H9mGW35zkmTqZDq0PGMVs8ScBh12/mBxlZfvhx/dlP29iaHlG1VO6Q9ADr+9nGs2uwfp
         ZSIA8M/0CLZlAaCcwa61k2AXDfKwlCdl3WZH0vkuyEZzXVq5+a1yeC8TeOzBW822cSZE
         1/Tw+QOcTmkuYBlyxpVxNy0NAIPjvAzlGKFzMsxwyaS2PONW5Zf/melSWzo3erh8sgDL
         Z7+w==
X-Forwarded-Encrypted: i=1; AFNElJ++TLnV91RpD3iKqNM2LyExXEglwLdX5iX1vdxABvmGGZ3VpHACD23xD35MV63nPKtgfrn5ffUzI87fM+Pc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk61oSCJ0cxxosFlHotH509bkOmVa94ioXEZGxDFC5rHl2Onmx
	72f55duYxyXB1PBO+hamAt7MkxWGwM9oWSpKnmdCFqfIPUQHa1ZVV6FxjYP1gwEgnQodC1mTEta
	NAHcl/RAF3kiCuugYvuFXrkQfsZ4rncGYM6gt409LCjjnXmjpgojPgR1nqtc5hvkdGvKt
X-Gm-Gg: Acq92OH/xStn5gS2fW30QbTEK7gZ3DoUhj7bJSI43Xmtn6UAc7qYR3x+ZNC+COfEDMX
	SX1RgNtYA308GTtXn+Qi/qdzGKks7PdRbQ43HVq4iaqGKLwdwlIrhejq3awphVd9Q1jId6OMlzG
	rzcJNDpKIy8HOhuPGwwmKJM/D9tZQX9192mQhtisqdqrh/byQI6zdHcfAVsyk/2ILfH2qJb4diY
	1ho11wFK76oxPBNQUL1RQlOsk+Okbs4wWZd0HbIfzZ8IgJbttwEbG8lJ/jWdSyz8l/Dy28KIqI3
	RcwAFcdhA/xvP5+n5R9QoYxYm4UdTB1tBRQUF+/00tOuQp7EsZtpLPZCdyGmwCV3D8Aix7r1yMx
	RsaNM5z7I4WfUynYDqy9E2ZTB4h2/xqnFGFIvELi2zqRd1FHh
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id d2e1a72fcca58-83cf5848df4mr17235940b3a.20.1778576085442;
        Tue, 12 May 2026 01:54:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id d2e1a72fcca58-83cf5848df4mr17235900b3a.20.1778576084924;
        Tue, 12 May 2026 01:54:44 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f03bsm23389781b3a.9.2026.05.12.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:54:44 -0700 (PDT)
Message-ID: <f17c3e4b-b0e4-46f1-90aa-99751cbc9348@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:24:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-hasty-pony-of-tempering-4f0a47@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-hasty-pony-of-tempering-4f0a47@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hEqssNUkBNEr-Q6QcTaVAwNhXJo85c6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfXyD69mN+AfaOi
 nOWQ5rkezK0uxk0emIRKHrrEuqebT7pTrWauia55jtOPgOJtxGi6cwoF3AYiJxSOYVOZYNhpHJN
 xbMj21Do2BpSZq3IechXtSCkTxnsYvwSHUDsxdwOlL0GXSsW86J397OC2P0zYHQjJiOcAqR/bDD
 Fm4zE405hK+X+2NMXRwJrdBqri3wvCA+pR9TE8GBy56khyCMuX277ETYQiT8jd7Sqsrw5yrXN22
 srk4lx0OesMUXDKfYrQpwd669XgrlOK71w9q8wfFsay832l/PKRnlkHOHNNHHDg9eIvpXzEG63i
 3Xt1PpNR9kHElsvOkaAJVDv4Ycg8HgngJlkD6iU0QeYNsTZnTEU8KCp/ZKe2blAlAlBf1k+dSK9
 EZFqaIHIfZ0k4uqj0SfP2FDembbzI0PKZ+xy/l30yN1aY5NjYcO0o893CeY+ziL8YCATfM1mrTU
 6+Aec3ZgO/wQ8hxI+Jg==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02ead6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2Qn1I_tgzRFu8vZVKDwA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: hEqssNUkBNEr-Q6QcTaVAwNhXJo85c6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
X-Rspamd-Queue-Id: E6ED151D330
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
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-107055-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 4/10/2026 1:17 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:44PM +0530, Taniya Das wrote:
>> Update the compatible and the bindings for CAMCC support on Eliza SoC.
> 
> I do not see any update here. Also, no improvements after v1 comments.

Sorry for missing that update the reason for Eliza not compatible with
Pakala. I will update the commit in the next patch.

-- 
Thanks,
Taniya Das


