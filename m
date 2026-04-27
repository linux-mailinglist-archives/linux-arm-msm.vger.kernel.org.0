Return-Path: <linux-arm-msm+bounces-104691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJwcCXM572mD+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:24:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C6D470F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 756A5302BA73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F6C2ED848;
	Mon, 27 Apr 2026 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcOj40Pr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMa3bpmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D77305E3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285041; cv=none; b=YHDKFzsfN7izoCHcnmisIxc/GnVapib/SdLFDiEm0C0w0E6OlMbxFsjbw0mYq6WZdt8K20AWqq7bnNtH3+pR0l5NYXZYGe7QWIzJqTwAteuozHLV0gpyIsbIy+CivX8vAQlCpXt9/3h3mACDhNIQfFU3FajGZ9zId3AWvxCl0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285041; c=relaxed/simple;
	bh=Q6DHCzGkdSzX0wIKldnuO5g87VInOlN9REDr9sMqMio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csuzT+/W8aJUzOO7/ZIUm4QMpccDOjEYxjG86onkzCBG0uBReX0NF4Y/RnZOxsNygECz07DRBS8XtlGFPgqKHrbFt2eR6r2ABFX4d7aCnQAId5O7aDd28fWuD7wsk6ZTEu/7iwRBQ3xgW0qa/7N0YrrMCtYLoc5NAfVM9ObFwj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcOj40Pr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMa3bpmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TQKF1762663
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QOeJR9MMb+CCifJaiTThlosrl9cY53ZcGTmCOcTAUtA=; b=AcOj40Prb/ScOhGn
	xuuTN1IHDgjv4nsIiw5Zh3mVFvlFPPStymvMvMWqZZvJMqwsXPJOQRUqvGdM4b+C
	NdrfoR4OaZwLixJDP2QjmoroibY8eAyykJcXPYYeioawg+sm8fisLemFQEL2+N6F
	8aDukehpp713RVmH4BAlGfOtpxOk0/4e73PvLVczaffCwHCEdEm6F4IPzdmka6yF
	96ENbUkYGLiQ+qcqz1m0YjBEpgjFjlAFtskM4TgGNcqnCj8UzdvKBK74A7vfeSrZ
	WjKUpGjyY93xYIUufzjUc5w0rerMnZHLzgTLkPZX0Hzq49b2n/2F0vHHfuRmR+u5
	B0E6vg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9dkkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:17:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so4433891a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285039; x=1777889839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOeJR9MMb+CCifJaiTThlosrl9cY53ZcGTmCOcTAUtA=;
        b=AMa3bpmUDTCdqevtQFvY5NaodzhTs0GUGe6kpOv88pOXReZwpPajqvZjyJHn7NO0/w
         qUyBEixydJ1rbSIw38TZl7JxnIY1OA44tSoZinA9EFMpYZp1VR9hlhBNph9j3kkQ/nqm
         jT33cbB8Fr6eqfCoNtGBfqfex5nbIztcXZsU8DSAIU6ByQ3iBXF/1o/CJy3R82YrqdUf
         2NWWXezLL1Bot5JvV3dqm44IPwFSeqX/ww4yt/uDfiW8YUCz2yiyl6B2RaPpHmIUvVrt
         a6LXEAb13ewPZVFoC2A00V0vPCTceJPhLwGGSH0GTz9WsPnHLYQxxBtgfGivA5tE5vdF
         vbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285039; x=1777889839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOeJR9MMb+CCifJaiTThlosrl9cY53ZcGTmCOcTAUtA=;
        b=ZUjRyKnGiczSvJHzA+ozB4lDPez0TzRyUhTwCAlgIkc3Hdk0LTAGGS3ygn/PIVw+07
         5wqKnDuXayySto50S3m94qX3CzfzDQe5ni6yJ2hxxNufXzEfc+owyg1/U8Vv8TR0mkGA
         pAMc4Y1h3b5dz8elI8NnVFWxH/fFV+/vky47KzseNtsO1rkfYorVnmPi6eGVf1QZv0f4
         oVS22UyXKsqXczHLIP2nwfpSlkEs4nw4MKfrsRRBl/PwSllSXUDU+d7Tb07t2rOVYxCa
         o7rzpf+QzXRI286ebXK0wLH2uaXo8NYxCy2jEDCdS+JvOGLIvLgoGk+PY9vJvdiBfUb1
         JYDg==
X-Gm-Message-State: AOJu0YxMhcN1enrOrNskmek0yaDGWwAyTXQMn5p4hNAhz8mELE3i7Eb+
	dm+XqwsqE8nbGpARbsFCAbC4OO06mo3zkWp/b23TyLyxkMg9nZF7oHjPUnTrJtAlOVlfcK9Y4OX
	i/Q7761KkfYvUpMi3/91kZ7LFdcIl/kCuhAMGazI2XD4VCtaIgXdn5GbGzERDh7oobY6m
X-Gm-Gg: AeBDiesibAzLoT6PT4nVZzpDLBYEJyw2TTzJHQEIvnV5bQcOjAUhhvj7ukAK3ZaeI/E
	n/wo3B+1MtTyAN7fWtGqfiYcwxt3WFoNMdPfmcVjTl9ENpO7zdq+f3TelIfNAp5e6+KagAteWh7
	UPCdJzWOc7S9f8VBu7eaqh8VLl6NmZATPaJcjS4bxDz9YTtVHSlJss0VqgOGAVQShbNAS84TInh
	nLO0BJ6CaH4IGpTChd3FHA6AsIYxq16TD2Afx6+RldPFHCCku/1KuJYrj8cpkevxEmjzCZqIPGi
	K/Fx2b+3elJftPMEMsi2YWrLo5fYZJ0jGGWYL8eA3XOG+xDKvyak7bMPf7dCp7/RJn5I+Gi/1lx
	VkS9yuDWrZMJfhm51AoPF45yKdzlVEq8Zvk5Z+W6Ov9q+7962Gk26HGFxPEfbhUO9UeYho23inK
	I9+RMRllzTvp1LXFZhipAP
X-Received: by 2002:a17:90a:102:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-3614046f98emr27402488a91.16.1777285039131;
        Mon, 27 Apr 2026 03:17:19 -0700 (PDT)
X-Received: by 2002:a17:90a:102:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-3614046f98emr27402467a91.16.1777285038629;
        Mon, 27 Apr 2026 03:17:18 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614371a7c8sm31332266a91.5.2026.04.27.03.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:17:18 -0700 (PDT)
Message-ID: <c51bf07a-c8d6-4790-9183-5863bb8e18ab@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 18:17:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com>
 <97c230b5-167c-41d4-9f36-e62b97ff202d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <97c230b5-167c-41d4-9f36-e62b97ff202d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xe8UzJ1ee2VaOW0Un_MsFSruwrcXHoHJ
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef37af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YAJqMnTD8kXav3sB2ksA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfXy6NOE38X+Tg6
 aX4t9X0rTD/WMk12P+YuFojJbPkGvHyW874dzqgp3o5k/Fplgc7DbNwHuQf+GP7Qb2y1fW1BCDB
 VN2UHWeiGDiIkoxHWL/hkFVfmOcxYHOnrMDK3wLvVaC22+rMfxa00qsMoMxkjaycu2TroBdvoUx
 sm04NxAZB7i0CtRpSnfZ1YtSK6pj2N7AMWdN0Od8Vl5XiUYNjjLl4GTwWa2D87NoqJTawIuEqTc
 GISTgzlhoEmW9y5AfA5aRaxU1dLOaibZzsX2hsCBvBcGT6KveI6WQL0eMrZ5ZUE5u7JVqJX6c1A
 FKTeY4Ixh9ZDbZJAZ2/GBZ46fb13LZGCAkLysv0QeYxTi4otXhJ8MRsBaelz9UZ21oELXP+9Ilh
 hvEsv2jj3CwesXjn+1TudVWSi9tR9Cr97FID3Gymqo+wQG+QRGLHbbnOddS+WEX0iCBHpSpAus7
 1hebKYC/HgeoJ5oopNA==
X-Proofpoint-ORIG-GUID: Xe8UzJ1ee2VaOW0Un_MsFSruwrcXHoHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270109
X-Rspamd-Queue-Id: B9C6D470F26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104691-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/27/2026 6:09 PM, Konrad Dybcio wrote:
> On 4/27/26 6:33 AM, Jie Gan wrote:
>> Fix the wrong connection for the qdss replicator device.
>>
>> Fixes: 0f43254763b3 ("arm64: dts: qcom: qcs8300: Add coresight nodes")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> I'm afraid this patch will miss-apply since the visible context is not
> very telling.
> 
> Try setting `git config diff.context 20` (you can revert to the previous/
> default value later because usually the default is reasonable)

Will send a new patch to address it. I just re-checked the patch, the 
Fixes tag is wrong and I will update it in next version.

Thanks,
Jie

> 
> Konrad


