Return-Path: <linux-arm-msm+bounces-96590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO+kLX/wr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:20:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA50249474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4384300CFCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6DC379EC1;
	Tue, 10 Mar 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iemtuUzu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4xxtbvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025FE371067
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137917; cv=none; b=Bmt2LWKP4YoT3Jy2oUnaIFWAkAJFrpJh9ovVbdchZZ1ppAoWxcDldXt13A75tMBbH8aC1nSG7ChUq4IgWb/hSiHHhcjp8m5Iq6/1IuMzVq2VP+Bkl3OkKKcPKHA/tdKDdL492HgpO7+XdOxZh0cTg1onRC3BpQRXKqH1lfnOxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137917; c=relaxed/simple;
	bh=6/6KqpSz/HPJSSYX3xQ5DweaUSrzMkS14FO8kxhhbiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LG+pL3FOnW++DWYJrHwGAuByQLsmv8SpqGK+F2DM/wfWLpqmrB8cKpROMcmEXzjBT9/H9Ozw8AgKux5r0wYprJLD47jlYAL7zrRXiQk5iXGbGLTPTpdYZkpR4UPhNEqA/qwof6r16kQECPnITzuG2HMMltYDt/NHPyDo1o5yDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iemtuUzu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4xxtbvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wa1a3124730
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oj0duUChrG3r/OIty/mgtnt0E7BOjdKdZWc+huinXSM=; b=iemtuUzu28+V4meN
	OagKFqMOwtcrQLCNT545TOWw6HT00wq1QzgYCT4+kCEehenA3i48hN9Ngb7N1rmH
	jecuTJCzdjsHHoxS0SmvCImdKgYcW6K7i0UQosEOao9/9PyUBF2h7mHvCMpgPmB6
	OHvJKepa8GTGPbL0yLU5peRGwVbafBNGqDGEvPJ1QL/OHt8Fak92QVYaw4KUfmT8
	FMIO3tmPtjc/COxrOXu0yi8BSYPgTuC2GnLBYF8AGmCUf/Iy/v4qGjbtCJ/jcKKZ
	1b1sEsecawZZLKQ/uMWZziuojzPF5YdEbV0HKmGv8osFBG8+OGn8FfapBPFe8DDD
	vpWe5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0j85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:18:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1383684285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137914; x=1773742714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oj0duUChrG3r/OIty/mgtnt0E7BOjdKdZWc+huinXSM=;
        b=P4xxtbvgfaIp3WNXFsHkxuiq2462m18Lh25NxqPPdGMAXcqII4rGs82Rd9GikcCmTy
         ZSBI/L9iPImHe/sJYOBLft8AFWt7hQ12UBsIv5qYvBWyyhqzVVIha5IgL/1ITbQDL9jL
         8YWM4JgCfCQbKpmYKcpg9gd/TGs+HdTWn/u8xPJgntxKcNLWPnDbKe9JYHEKBzaHMzck
         jGXQItCtTx4g5NlbcefCEonDNB6Wn/j6HteQ69IbO/RvVfRlEN1nUZzvsB9ydmZ9dkQs
         s1MlO8T+n3Jb4iwnL8GC/2vHeZQdykKvbd8dlvtcC2r0kiNsM6kHBJmrgfvJE1JlZICu
         pfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137914; x=1773742714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oj0duUChrG3r/OIty/mgtnt0E7BOjdKdZWc+huinXSM=;
        b=XN/MOrt44uiWlMy9eXFWFLoYCq5DB6aVX1DwAvrHzKV+88qfsTF/3ZDY/ggUKwGi90
         u50anVIx3n40SUBFOrIHMugnHnmkZoh1XOT7CeF/SqjNaHJZNawwtrAAft7SME5cGtW6
         cgHH/aiu4KODr657zrZ1ekb3qQ7Cd2Onz41Wji7YMYgMn9GxHuFjKZ+VfLGy/RBtRFp6
         QYk6ynNWIwuCE0woRjl/0wAMwQXZQ9eQhn2EUcNj9XUH/mjcOjS549Hwe+27+4ds7oGo
         KHUbxDNBQkWOIX0DnYz4md0bI1TQauy/ECzWbpe7UYBekejlqNp9szTwgLfqLGGZ+FOZ
         +TJg==
X-Forwarded-Encrypted: i=1; AJvYcCUOq2kZj0JLYPD6tYi+xdCVdzZIlXDeHQ8ZS4HYH1PsDH1jOP3yONhJtWzVf+K8IcIfsIdA7KtBSnGsOB11@vger.kernel.org
X-Gm-Message-State: AOJu0Yzywg63Dj1nhlK8f0fXWr1IxxCbo9QBGTI46+/NCI8aa4WsyciC
	jjVMf4Aff7CCy66tZZxF7PpuVl7os9KOri/qZH8w86yWUYKh5YGoaABIB72lr/2ts22Pw0yaq3x
	FBs9JsmcqmY6DZj70hY7bX4g6iLZioApAP3AJM/zpYkPQrstdNEzdz+tK0bOk3LgPokG1
X-Gm-Gg: ATEYQzx4eNsGBCffAjW3GC5b/8f87c8x2Qh6aAaf1Ug4evGT2UZFCoA1EoTgKjnSlfN
	EhBbRTxlF9JQ+OH7fT+gFr+caGFWVfSDneVUmgdVDHDVbk3UmiUz/XNTnmj3T1N9ayiGkGavElB
	XiHJwKCmDB7VlU4gqOruQpYeU6WT7Eq0klTqYk0RrdUmjBq28gDLIc3AjOIgQZcrp92UEnqJNqV
	jKyhm2f15TKEGwv2ti/BPStqSj0paQtFCZJLJlOPjOjNGKPqe2OuHOtNb36x6Rlsxo7RqIySYZS
	k6cd3AXOsmZ+bH2AQttMONazdFrKRlDf6Pd3DEqJB8GoYluw1EX6fkTwUoWK8VAH1ZD4/QQTsdf
	XmspJLfIar+RMqSKT6eY2hQWAiRNL9HBo4swpLgOCt0s/Q+JlAViD26gy0YxLIJH/J7XQkx7J5s
	N1rcL3P6g4
X-Received: by 2002:a05:620a:288e:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cd6d47d005mr1813032185a.65.1773137914422;
        Tue, 10 Mar 2026 03:18:34 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:8c0:cec4:b6fa with SMTP id af79cd13be357-8cd6d47d005mr1813028585a.65.1773137913981;
        Tue, 10 Mar 2026 03:18:33 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm66574275e9.5.2026.03.10.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:18:33 -0700 (PDT)
Message-ID: <fb4c5d65-52c6-4a25-8c97-6c2e1df1e3ec@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:18:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] SDM670 Basic SoC thermal zones
To: Richard Acayan <mailingradian@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260310002037.1863-1-mailingradian@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260310002037.1863-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afeffa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=ubao2W7AewvDnVcLIXgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: No8fL9B6dTmubqerHf2Ad4P64kbcnJzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4OCBTYWx0ZWRfX+DGUajWpDmtT
 eKwT2aMsRuVQ0U/+9OA1o1bVBTvqQZV1amTaCRgdhfAdFecs1kA/WwtCthfggdRlVA3H9lLs6Pz
 ED0i/FXBLR2h56sGxnl789vcCHv9laN6+YNxjDAOi5sJ3LYKWea+OdeEfO7QqZWGyLkKQdyDyrT
 rN2KVDoE5J/PIA5EabSd+xEXPXPXKeDs8yI5HmZup+3duDi/gdRwwOQdYq4q7Qimz1b4xkx7/KD
 Jy1XcUl7tHzJ6EB6rWBlcNan4tNMsl6M6K4mj6p5jxEe2Mi07plp3/gSZ41nNBbMAHYUL8vLrNC
 kwiFIGAD0gxOGxn0OUmdRLuWu0FKM2g1/XifYr6gOYELA7MFpIVhrcBRtOHP2COuE+Y5tgWPQ3i
 Z6z5m5lRypQ4W0+wzsnKaAXmC/OexXwn79NSQio852nR+l0L56MoGwc/QfKH96RTHsAGsfgQU02
 +TmM5cR9wnm8j8XLFPQ==
X-Proofpoint-ORIG-GUID: No8fL9B6dTmubqerHf2Ad4P64kbcnJzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100088
X-Rspamd-Queue-Id: 2EA50249474
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96590-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 01:20, Richard Acayan wrote:
> This adds support for the thermal sensor, for thermal-based CPU
> throttling via LMh, and for thermal zones.
> 
> Changes since v2 (https://lore.kernel.org/r/20260304014530.27775-1-mailingradian@gmail.com):
> - remove cooling from memory thermal zone (3/3)
> 
> Changes since v1 (https://lore.kernel.org/r/20260210021607.12576-1-mailingradian@gmail.com):
> - add review tag from Krzysztof (1/3)
> - replace CPU thermal zones with lmh (2/3, 3/3)
> 

Applied patches 1 and 2

Thanks !


