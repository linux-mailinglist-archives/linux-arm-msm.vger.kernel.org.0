Return-Path: <linux-arm-msm+bounces-100360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKSwNvuixmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:32:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B5346C9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF5BF3118BED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4105331218;
	Fri, 27 Mar 2026 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DX/tF2E5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVGjigXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B714330D54
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625097; cv=none; b=M+qRNk/AMIOz/oJzyz82b2rUg1D6hm0q6OHPjxTOQyuhWlj0IgKc0BqaoCNf3SytRLp0+dGy3Be8aNdQxFtij89qccRJ+JeDELKOXQiWAK18+dPc2qJUdIk8bzszv5gY04+TtoGGknMdBpk7ONNl2IH9OVWU33JN2UtlMQP4HA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625097; c=relaxed/simple;
	bh=3KnfBMTTF4C7BT2e2m/fho4mprI7VFTBf/cUz4blw9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktHHfuGTMUj0qtEbnY5DXcIoOfdyk7YQcbZgLrEax17FrqWjJxwrUZ+tm9JidXD7zvdfPSb6mQseKvlV4VZU+8YirXH2FiFqisNiayBn11aq/XdpsPxs2bfNbRYqCsJhXAstS3Dr+ZvTFhDd9rbzQ6KcdDE8jlu97gGn0Ck6ufI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DX/tF2E5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVGjigXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhrVL430680
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LBUCQN3XaZLPNcph9CDv9CuvtfskFRgbZnBJyWKpCSo=; b=DX/tF2E5tKzG1KnJ
	RiJlRQaVFrMzOV7MTJSv+pOO6CRD03wJKMoEzRYzx+lPIXZPzQGwXTSgma9BQhEe
	2jr3kl/NWqTeC58woODHVp6LylMtMC4Sm5XrGn76Ywxhb1kxvS6xqHp9x7e9RM3n
	bH8+jBV51eqjtgGL45z8kvcnpvozzh5k3y7k2sa7HLQpxp66mW7Ao1IgsuISH8dU
	Vhz/uEP/3oZAfzGJYTnAcKwcOiZEy5Wb4bPX6LMk8Ah+XSqLQG5TH+6DdHXuLKI5
	lRYWCLz3+Hp07DdM6h7liGDbj2XSGi7VQpH/CN9VWo96zIReaBj/mrCfYK22cbG1
	gWmuLA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5haptns5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:24:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7414516609so1530875a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625095; x=1775229895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBUCQN3XaZLPNcph9CDv9CuvtfskFRgbZnBJyWKpCSo=;
        b=VVGjigXeqtauernFLO2IJYgtALPcaIcAB9tyCxaUWITi3dHAQRIaCmaA0ejtKzesum
         DNYPAzKXj74vJjvpPMPXE9sTTzuIlc5SoxT9qcNVun9KMMsxda7zvvWbNWOJ8ogx+wUt
         tU5hkOmtHBRfWqgQCW6O7dGxxZtwjhFHNsQRvL7YG7YoA/ElvsVKSAWzE39XXEzMofJ2
         r/ibfIhIZk9Nncp+nXrGyNxmMtLjsCwJb/0iPKR3ZW0Z5CUEMyUnq2BYAIVcQPghh2L0
         BFvOd0dss9ti8Rf8ERxPDEvWu2JWMoLzUcXYTqoYKGgzXcOkJ4bsoXIe7biekrcODEHt
         DeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625095; x=1775229895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBUCQN3XaZLPNcph9CDv9CuvtfskFRgbZnBJyWKpCSo=;
        b=bS7XiVoTWzIhfxVZCUrMb+DV4gpBYxoXyhZFSDy6Et7UbYU2wQghtD5sXRlpoD2PRw
         YrKbZRMCVNziwp4zmVbc7B5BmmYBxGj5JJHZYe8b7D4Jfy/ddbcIlo6Ufk+RMM0Hpjli
         8jfCZzy9Ibf3v/x4OYa1yk+XMB4Q/cHVfxTJMDjQR0aTVmsBG8YAmQYogrevy9umvYMo
         vUD0eYPhS+HA1Hd26kBuWNBrdYSKVMb9hNQuJvZ5xwmncVubMBjJDL2UR6f1939PSnvG
         7h3aV1rzsiuCpvQfE/StBlvv2hih7LkikGoJFArNVo+Muz+yrgRm7asRuymXTnGpj5n2
         J/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Na2f9IOYJFhCKrNiUkGlprA/K9Uj4CYbZR5zJhyjQOdui+scwN1hLUwTtOYe4EKLv8sLMIU+ebVsbS+d@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZLxRuHHVOepIzMB2wlS0b+xLqHOnAoM+PdrpAl1DfZI4m8LC
	DGfDjNTMJbhgTbG94urhgD5FC48VwCe+hOLvy8rSdf5HXdmPWGkyur92aO6eSxeJ7cjNjDxt3z5
	gvYnSRWFhpwVu/hlyTJp/loN8q5Da/rjxfSF3MYW9IhBkMG/A0VoYwlpEQ00YC4KALcZz
X-Gm-Gg: ATEYQzwFKUecy4tPEcaqOnnH1hfcg3ttEdrjO3Uo2XGhRLhUP4/rUCmwEE5yfOg0xVR
	qKWDFIIvyIQln+XmHea1qMxPPdpbrrgPZE8nT2ymNLcPYgnY+5RxfQN8FDK92oEw/XMvWDqd9n2
	GwKwTrSj1bHvO7UO75+9y1qVhlOg4kcHTvPfG8q5Qt2wFecnBq5tqYw4/xXWfSx2jFy+Y6Sof16
	6x+wshdB5K3PSUKt33BREyhhzqK2729nAdjRl1kt4DHQop8Jz6wtU49fkFY4dfk6F/yRMF/w6CG
	DWinqWM9lLN6pBOWyFuG4gnMj+RuBiVttIF3yC5iYI0soILm7ZkrAixXTYVviCBsfNOQo86NEfO
	a6eo6aV6+2JFQ3A7U6/l/KZliHHuaJXkJcOb66zEJvXp8E/sff5rqqg==
X-Received: by 2002:a05:6a20:3943:b0:39c:50b4:cd50 with SMTP id adf61e73a8af0-39c87c4adcamr3224223637.61.1774625094901;
        Fri, 27 Mar 2026 08:24:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:3943:b0:39c:50b4:cd50 with SMTP id adf61e73a8af0-39c87c4adcamr3224189637.61.1774625094398;
        Fri, 27 Mar 2026 08:24:54 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d21a5cfsm6247175b3a.22.2026.03.27.08.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:24:53 -0700 (PDT)
Message-ID: <b557a261-e9ed-95f4-f265-21d74c1e5f33@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 20:54:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 09/11] media: qcom: iris: split platform data from
 firmware data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
 <20260320-iris-platform-data-v9-9-3939967f4752@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-9-3939967f4752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6a147 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX08tlAzvFBa2e
 x4S7vnFkvJ7iCKoiVuIMdKsJttKXxuaYckPPnMCe4b/gvdcwckXKsc/WBCcn7eiow8u6Tk3juh0
 4VbZlK/sxSiEeIzn7R5TMv8jkHtnd9yMwV9ImDdy8HJJrEf8BTt1guS9qDYCz8ZOZxWdwHbpWDy
 dZAKUiy/JQJPN+zXVBMBMZEVTw51SeeDl+EMGhYNENjgY49eGMb5uAcBpMXF4C2InqY3TtPaC6X
 N7DtF8dAoOO6aMLNdEx4Ps/2DupTeXe66loJrY0gfvL6ZU2C4PoIMSTAMZz8v+uEoyNmVN52A8P
 MOqciBB/sGhbUzNXTKJLljzA1djwYXlJJ1W9Q0pglvHGrx0e1yc15Rtt/MtZEg5TFouJRNTb3Of
 SVluwnL/Xlm8ivAXPtDyG01PmCY+bqAA1hEZrVckQO3H0u6560+JMcaT/nxscne/N+m2QyQSojt
 eLxSL9R+C84jHYaoYUA==
X-Proofpoint-GUID: 7gbfi09Nq8HHECZdhtCFZca24w4ls1Lz
X-Proofpoint-ORIG-GUID: 7gbfi09Nq8HHECZdhtCFZca24w4ls1Lz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100360-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 513B5346C9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 7:24 AM, Dmitry Baryshkov wrote:
> Finalize the logical separation of the software and hardware interface
> descriptions by moving hardware properties to the files specific to the
> particular VPU version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

