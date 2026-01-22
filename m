Return-Path: <linux-arm-msm+bounces-90190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOPsHRQXcmksawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:24:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2358466952
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9671905E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B0440FD9D;
	Thu, 22 Jan 2026 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQnmDmxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcO1TR39"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3593AEF33
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082086; cv=none; b=sSNPg6zZsktocrMmOou1SrxYh4fWv0i0QdrhEeJF8D2IeOytbE/46+P/FOjzRAYsG5SXR5zc1BA/poHTZRdpfeVsN53/EHqNBTG9Dn7OSPVRKoCCg6UjKvTy8tdcP/fNLWliLGHesFvGPpGxXV/DgHAk0LlJlzhLvbGRh3vsJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082086; c=relaxed/simple;
	bh=CKYnl682RvJ3UzLL8x4CY84w5cp/23lvADrjqhwHjqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYyJdSCPaULXQm7EKnVUxHHyYQI0IqGMm/BD8Wf2zA5btN8hkv8Dg232y6tzK5/4OXhOGsPgIeIQvJjiSmYidxiXlCj+PuYicB4p5XRYzkfrdY9Vt67c1wy+4ljrjfP4p1Iy3auHu+/zlaIik/PnDRPGDGelhIeDhPfHU6b7138=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQnmDmxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcO1TR39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6IGAD3902115
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5mb2xuHVL/c+fUmybZe5qxJyOyReHEwepejMNDmg1Q=; b=bQnmDmxDqhyItZTH
	jk3RZrzZVr543ZMTCGBixnlHh9O3z+mw0CFzoeRB7yame9IUdpnE+bfvmsljAVBW
	Nf4VmTmL6gVZNXXaMT8kxVbKwm39tznVXCeMmHbB5nOZqzCFc6nL5+XDpI3Wn2gl
	oyukRzaLMm4S3pWMerUEkw4n2tiNRRJJ1ax9bPlpt20+2DjyA9EzjU/oE1wVapAQ
	ngGXJRWm2ELhg2pNJPn0cvFafeteccAN3YIxXG8B1MWhXZuYyYvDT4yrl2ZnpD6W
	qiwMzIexBWWSOkAcfcA8uh3SbN1KYuvofy710A4gm+TUfDtWPfDUjzuubCXP6ibM
	LILL9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khjp09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:41:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6de73fab8so10835985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 03:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769082083; x=1769686883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5mb2xuHVL/c+fUmybZe5qxJyOyReHEwepejMNDmg1Q=;
        b=HcO1TR392JS+/ZcQ/K5gbWVCfVD1Oj9elfvPwJ8uEG6BhSPCPQd348C/YhKXwPw89Q
         ri1cssqEKFZmR9C81p0RZbHUb9Z+a+xytRLPs+zgVMIazASfRRb8BhvDdYMw7qH0DH3X
         8wwEmuOfJYm7RQATZ3vnqBvDtyXx37UbZgzxkLY9rjL/5bMo3Dx7K+YFslpsmR+NkTq6
         J2EbsD0jv/WotIiMau+PLQON03hLng6oGTSEldYgI+LCG1j35D/yGB9ZcbmolIXoLWYe
         cmqjSM0ssVMUL5xaXP2Didm0UxyLVxWFsp3L76NF6Ajggw6orz8wvbuB4JtmxZuNtrzj
         W/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082083; x=1769686883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5mb2xuHVL/c+fUmybZe5qxJyOyReHEwepejMNDmg1Q=;
        b=sxKcyJsXtHcQecMPh12zUHMl6vSIWcqoOWxLjWJhMRMBdEFlFRBvZkaW56olpO4ag2
         gvXn1r6uPopQEw0AhFQW2osnA8UunYr2K/i0itS/5t0vOIlahR8BAc6qWZPNJ7JC1Jgr
         jbzy+kXva8vMULTvOUiB9rFrPcO6AyrF1wEaMaMIW5piMw7JYthJ38QDH+iRia/CXvNM
         +OmdG14dbjre7Di1t5xmQL19GN+qLJKycJf/D65qTnJF9laA7DQbYRIhxEKCsbNRPWCu
         7j2Wl/wJDSJhsomTZwbQutXy9HnlyEXuKUX++hohjUCQ44kFD48RCeh9NjLD8ZQ3mAlv
         P0pw==
X-Forwarded-Encrypted: i=1; AJvYcCVFvk0BPp+iz65WBfWw4izL3viEXAX46etM5+GYr/wjN7PCJ7O9TrNKTS3bLaLft9apmV2pktSFgBS1K5VT@vger.kernel.org
X-Gm-Message-State: AOJu0YxfIXoQwXrN98vgzSRcPSdI5o/iy2l0BZYJcnZvYcd2Wa/WKo4x
	frEz18+rkwqdWXWFnNygWxak7zQyKzwTsaLhaWg9d+ie7K1ygJaYfgYhxh2sLwbrzdl5YlZmAi9
	kCnpM33hT8xNwk1ij4krme6cTD9sSLa2P4Egx5QTbDCLBNMr/U3Sup5Ww/hYTyoypWIGE
X-Gm-Gg: AZuq6aIzgm+DGGv+KW2uXO3aiw9gRXl4TLDUKR9bwuhR94d2Z7WkaBuvGGLsa+zhF/l
	0QGdq7e4eP87kAo5mrGW/srlkJVHkcD5DQnUoM2WN2yy1GOGutEU1QbHg7ZSBolsHCTlJwmp02K
	zHcLb18zJBKODFovz09os5VSzX15qNkjaQ6sWuIfzixlvzIEnwPVv8bWN9yBoM4QWzWNuvv8wQg
	91UPgjxA1gh3ELskKZ7PKJSsDgMuL6lTvVmqALViJrPW4K7gvegCJMwZ4uVWntgdMWo+bY0UUSF
	oK4hXEOWXOM6WTcjQJvrjLg8MurY6av9+0AmZa8JLrrFl8wspfjCvFiNmo+x3cp8BMF1ijN2JYV
	thGWKeatxws1xjYD/WGY9YoTwT0i6MA35mBKI/5JHKDmnne5mfO/x9dt0AymnzSjhnmA=
X-Received: by 2002:a05:620a:319d:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c6a66e36efmr2265627185a.2.1769082083198;
        Thu, 22 Jan 2026 03:41:23 -0800 (PST)
X-Received: by 2002:a05:620a:319d:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8c6a66e36efmr2265625985a.2.1769082082789;
        Thu, 22 Jan 2026 03:41:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b884d2040dcsm15818966b.47.2026.01.22.03.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:41:22 -0800 (PST)
Message-ID: <dbb0f735-4aac-4e0a-9c47-69a60ac664f6@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 12:41:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpufreq: qcom-nvmem: add sentinel to
 qcom_cpufreq_ipq806x_match_list
To: xiaopeitux@foxmail.com, ilia.lin@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
References: <tencent_E072C90BFC84600EC8B529829AFB81CA0105@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_E072C90BFC84600EC8B529829AFB81CA0105@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4NSBTYWx0ZWRfX2gGM3HGsUqKF
 d3iTNcXtkxChihlo0Itb0XszI/dIdheIlLy+Z8+gvHC2pLj0LaMWdDXlq4iX01AI//hvPKFxvuW
 cZcpZiiYMy0HXL+TYUvgVIfqceOGvr5cVe/PzK8kuzNY50xyTaR3IRcHed5R6v8Q19cwEzEaiCU
 14Vpo+f06K2Oq5ApYOOgLp3kqCwUmga9+JNc6xIbycpH4EWFw+Z/mrZtML4orqHU7lzPkOJ9NI1
 ywkdwZLbvU5ozJps8r8R7XaA1LxxbQfh6X8Lp9o3TEya5q+5FeTNV8YmU0UjexmklFhf8xOq7cf
 jFfih5jd7dhFZUTUuvSTU+4tcj2AVI1RjhYTvfR/DO0LoEi69PSmrgnckFpLTsoOWUStDdaN6KF
 cJ+VttHRyBx8yKneITK7Q1+YCh/J/dLromc+gStCRI5QPqZrgrUxkilyIA1GLMcF8F6WQSR7rRW
 wrr7kk3ZYxRmsANUH1g==
X-Proofpoint-ORIG-GUID: h0-x-rNxW-UvV8tpUELDF0cavU3o9Ips
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=69720ce4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8
 a=NtSJXH4osi7-RDkubBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-GUID: h0-x-rNxW-UvV8tpUELDF0cavU3o9Ips
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[foxmail.com,kernel.org,vger.kernel.org,linaro.org];
	TAGGED_FROM(0.00)[bounces-90190-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,foxmail.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2358466952
X-Rspamd-Action: no action

On 1/22/26 2:44 AM, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> The of_device_id table is expected to be NULL-terminated. Without the
> sentinel, the traversal of the array can lead to out-of-bound access,
> causing undefined behavior.
> 
> This adds the missing sentinel to the qcom_cpufreq_ipq806x_match_list
> array.
> 
> Fixes: 58f5d39d5ed8 ("cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
> changlog in v2:
> Remove the extra commas
> ---

Thanks for catching that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


