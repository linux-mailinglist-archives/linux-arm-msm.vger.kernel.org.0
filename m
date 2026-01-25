Return-Path: <linux-arm-msm+bounces-90460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1cHEJhczdmneNQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:13:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F978120C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFDA43003ED5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5981DE8B5;
	Sun, 25 Jan 2026 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX+Qg9SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHTCSUhr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D01C5F1B
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354004; cv=none; b=RoPeGEl1BZfNQzN/V92rFV7LfYJUcQManQvOAeP6tLIK2ZSLXiKXHyaVdM6H9Vu0QxQWPUgvw4LPWD6E4I1NQJTLhM0HWA/Yb9grUFYvLtRek0JUijj01YIj0ReaCiuXyF2hUpe+fJFZqSZjJI2D90J4ob8TFHMoT4iuotdlN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354004; c=relaxed/simple;
	bh=UmqXtNydcPLGA4T//8c5CgSoruThe/ufjoIpw5yi1EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m//GdmkJ34re4wFbzyaZu/1shXEojX5caDUnK0ztlo/yBjec83MFoO1BmEhfhHtHSIRP8Dlf+TpIYKJhelDU+t17QbUY7nPt67EsEOBN9r2pRLeRcpfwtnhZc/QdfmNeGOiZYtWg+k1tkX7sCqgeTIUv48Bo4+h55FQkHw48vdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX+Qg9SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHTCSUhr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P4ON4N2242270
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/aSejb4mrLZTSXER3RKLDIoB
	L3fYv5xHShF0ZL6AEsE=; b=PX+Qg9SBYHuhlTjJmrW1v+gL66vaCTR5+I5TY8NM
	iwCRnfj7QPQuogVbpzcLk05MdbxEw5k479g5c+y8f4HeVBbFZW9Mrf9eyXFApXdS
	ZqGFWTR1GIH5xDSrmCuqX5aTwTHSE5Opoq4gUtPS7glnRq2SN558ydSsDhfFAvid
	9+58Y6Zu6ReD1851I+yhQloUa391tt3K90REwZo0UJe3kIkKv4oINAGqaaSsruVs
	aMI/eH01fbsdBGlb17cIgj1eui7bYpWWv3ElfnnZ4yQfA1giFcC9N56ffr6mFa3o
	SSig2UuCW6vEgjdzQFqDFeWxcDLt5/3GBh76HxnjWbgIPQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wssfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:13:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-894766748f9so178067516d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 07:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769354001; x=1769958801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/aSejb4mrLZTSXER3RKLDIoBL3fYv5xHShF0ZL6AEsE=;
        b=dHTCSUhrbl49rD10KYwuC3WJh/lULRnh5ZOL0lmSWcUUeAJdYVVwPuoghznROfNH1Y
         IxdtwBp++XE6mTYyKVNB2PIDNwZx5LGZzXyo8NZ8FSjEjS3m8fsKjFHn2gIUwzeAgMf7
         A3rV2jWzrn9Zgj2cmN/VelAteSHMQi2mHxjdSnmnkZmV4tGJRaphoWnCWBZVCXqsmDF4
         q4HC1h+DZ+y3X9rUlTrpJkgvP0NzPN0rgnLEq/d3vh3j1NYfm0jQUh510t9sJUMlxlBg
         UtZgokADk+WyPWjsgEPzwEucNlvfme0LgSSNjXdDZmdIuAWHNWzInqNpkC3LwziXu6Sk
         THyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354001; x=1769958801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aSejb4mrLZTSXER3RKLDIoBL3fYv5xHShF0ZL6AEsE=;
        b=wrRWMjrAubI9ptNCEMgO1iToNS7AxfIzrFPyUcSlVwv+KDnhrvp0EVvomeL4CBe4kZ
         PJjDhfb7aJQ59MF0/kXFLmdrPCpZyr3bgejkTVPhc9t+mropHNmiwbXLUaSsPyPVfhp1
         1DVKoUY3f9+gdRKplVDiwasDwFd1wVSAdeo7nQvZFEWWex78JhYm7yhijR6QNJEFF/6X
         NCgxExHG1VPI+MMSrcvgUvayTYpzsVb6IRv5Loimh0f0ZlqZo2/5+nzMnUsbdB0Q5xeN
         pDUq/hkp6T29qde7Ohc/X8u2AOPE2V7cCsP8VcBpRyUQaffTmBjQor7qMG5GPZ8+/WOJ
         Bokw==
X-Forwarded-Encrypted: i=1; AJvYcCU4K4Z01rP/k7pSOp3XIQIVmj6ADT++2Q32fWObKryFXakbnPNRmST5V4fF85LrLwBiHJwKblKOCJg+6wd+@vger.kernel.org
X-Gm-Message-State: AOJu0YxkY2QqVJ3Jdw3Q7gczo+4iwmVWV6/Lr1OYOJejwtCrexy1o6tE
	ovGrUDq4tZFdkA5PfUR1Xe3kG81+2QQDLdzHWDzJZou2UhisQq5OjzCYqmrqjNeLNPgtO6CiB3t
	xzasaPOEPTSYlIH3nvLLQN/90jqIFPhwvGOAe3qgRMj7b+aSw4WGhJujh8kqJW0OQPKy8
X-Gm-Gg: AZuq6aLNTQ5cO4qfQQd7TLuP7UYNswgrJCPQQlJKlaROJtjduy83A7bHNuIM5R/px4J
	dLCwFErwcpBTBwUPYviBW8toisfdnhnieLZ9uKI06YzKNot3nT1H38DS4SVCAMxodOzRWl/zGWY
	GvSfHisE9Z4q6g/DW4PQ3TPVizPnci/4vtOoF6jFPKaeTKhGyZZ0c8Smsd7+/u2b6VZhiXUktJd
	KaFX+KoTeWibBPwxQUsa4pMa90FCSMDB4eEZbRWCyvqXJfwNcvhxsdnig3/vemqcpf7jRH7HmoS
	rvXpC9Ta/hS3PI9eDFZjQwUk7Kxi3fnE+URWs18bdZmVEwEynGpFeADcAFQ1vsDLgMuVRuBXA9/
	H4d3o5C1POZXyJLdURiuuiCyMSSdbUwxWtJZfhR7TiQmxtUPVKtje7hi7jTpZUtdkoCo8HclYj0
	LwVnuW0U9QEwIPVYL2I8xiEfQ=
X-Received: by 2002:a05:6214:27e5:b0:880:51f0:5ba7 with SMTP id 6a1803df08f44-894b0752f3amr20236466d6.42.1769354001332;
        Sun, 25 Jan 2026 07:13:21 -0800 (PST)
X-Received: by 2002:a05:6214:27e5:b0:880:51f0:5ba7 with SMTP id 6a1803df08f44-894b0752f3amr20236126d6.42.1769354000755;
        Sun, 25 Jan 2026 07:13:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da170f70sm18910051fa.27.2026.01.25.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:13:18 -0800 (PST)
Date: Sun, 25 Jan 2026 17:13:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: GCC headers file name pattern
Message-ID: <jioy2avjhyo2g7m6igrr3opikbnpp32heucpamiebqbx3udvlj@itrwcbog2m5w>
References: <20260125150509.GA465352@pevik>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125150509.GA465352@pevik>
X-Proofpoint-GUID: WC69EJrYkrEQCbBt8tZryepYfk5oG5ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEyNyBTYWx0ZWRfXwSXgM08v/Sfb
 je7lg8+8N0KMmrnDnja+7zfpqATiRpcmwDA47PybtSX3crRV069DoMsKgOKGCim3iZ4ifOzVqqs
 FHp7OwpsCuTfg316ZJb5GmOB7ePAfUUQvz5bQjZbMgOyWoGxHClrEBYfUbGnjdH/GYuNZlwhKx3
 6TPHSn3KJgZe069X8OEEZs0Qsz0hCv74m/OgVctTuWLtK0oIZ94cllocYkwSiULZbrhNHtIK+/2
 rpqnDy583dmgRnRG5fiIsmEYKQlNDNcHV/nfNwfiLpJCZMGYMGWnnTUQFT2qoicK7/5Sz2ye+DJ
 aluTQC9B/rZdYxd56QC03b1DIGqWNTjQbPlgDAMnzTGOTa5ffaoXlqS3PcjE1T2NQ07trT60I1s
 zGdHwLsj677Qrhv/3uhG+gUs8WTx65dwq2t2tTfjfb6WH6QMti+hjTWRFcJefyi8obuRUE9PvC+
 WonQXPIUybvpMQfj6fA==
X-Proofpoint-ORIG-GUID: WC69EJrYkrEQCbBt8tZryepYfk5oG5ti
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=69763312 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ifhEQVqduOEErdRrK24A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90460-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0F978120C
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 04:05:09PM +0100, Petr Vorel wrote:
> Hi all,
> 
> I noticed GCC headers file names for SM* SoC have 2 patterns: "qcom,gcc-sm*" and
> "qcom,sm*-gcc":
> 
> $ ls include/dt-bindings/clock/qcom,gcc-sm*.h
> include/dt-bindings/clock/qcom,gcc-sm6115.h
> include/dt-bindings/clock/qcom,gcc-sm6125.h
> include/dt-bindings/clock/qcom,gcc-sm6350.h
> include/dt-bindings/clock/qcom,gcc-sm8150.h
> include/dt-bindings/clock/qcom,gcc-sm8250.h
> include/dt-bindings/clock/qcom,gcc-sm8350.h
> include/dt-bindings/clock/qcom,gcc-sm8450.h
> 
> $ ls include/dt-bindings/clock/qcom,sm*-gcc.h
> include/dt-bindings/clock/qcom,sm4450-gcc.h
> include/dt-bindings/clock/qcom,sm6375-gcc.h
> include/dt-bindings/clock/qcom,sm7150-gcc.h
> include/dt-bindings/clock/qcom,sm8550-gcc.h
> include/dt-bindings/clock/qcom,sm8650-gcc.h
> include/dt-bindings/clock/qcom,sm8750-gcc.h
> 
> Is any of them now preferred one? Or you just don't care?

The second form is the preferred one as can be seen by the platforms
(and time of creation).

-- 
With best wishes
Dmitry

