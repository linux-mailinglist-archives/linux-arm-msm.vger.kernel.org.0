Return-Path: <linux-arm-msm+bounces-93134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CIlAfRUlGl3CgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:45:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AED14B899
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCCA93006B1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FD61F63D9;
	Tue, 17 Feb 2026 11:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9YnCw7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+AUQoe1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B92F49F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328753; cv=none; b=RiZhoI+xvfcFn/gJ/Y8ZkYX6t+lT5KMR3DgVIh4a0iQclVoYNN1LJ4Sx6WikqgZve2/UA3KAfK4wUCknL/A3yEBm0D8VPOvDGQduBIHni6JijewkkbB3Uie2MPvHACWzlB4U6wxZlhAiInDdFhF+CowzRst7FwBm5WvhHkg/iis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328753; c=relaxed/simple;
	bh=Oa0+Wwri0YI+nReOJLFYlJMg88RbzqeC9YFokRiIW4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzxLy8aSb0muZ8AeJN4ELLnYPLvCcJ5ZGIp5QvaN3A+WpVoj+8F1WNNgMJaPijT4jcHOp1AT0HSNHBtCc+7jaW8OLHrW8OZQFAzGK47xchZ4wTiCRji8NlqHDjZj9zM+VpijDTrAAHTUlblfNJMzRGTS4A5czOUiprhYsdu9cNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9YnCw7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+AUQoe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8fSt81545010
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DAB7LE2JysozOKo5lhqeqihE
	jyqZrs+8+jW+etQdq2E=; b=Z9YnCw7cMXTt+6ZKumFCX1KNbLo0bIbn5hdYt6pt
	XBS4X7J5SiIyaT9dRGcQC/604DHcCxJqOz0JSXoSi8IiM4ytv5i9EFckA6cUXnGM
	f6s1Fr3p6ANhPlgD7vm54Lc5RKhg/8cW6Pt+d2hglM8YAlilf+STHjRfnfFa6P2Y
	dTOphBSU7cuiCUIYTWOvHTJXfwMAJFTmr+1y/sNf5VfylYqCTIL0uasJs7y1b1hA
	ze34jV/VvLA/PvJt569wuis4B5SQyh7WWxUDcigWodrF1sZcZJQKkoET9HGoctj6
	EnP1kJ9avAn4LRDDXE0rrm7sKu9Yw5G7FXEjP6YswvJV0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajt1ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:45:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so2687796685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328750; x=1771933550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAB7LE2JysozOKo5lhqeqihEjyqZrs+8+jW+etQdq2E=;
        b=V+AUQoe1jUGlh7f8B6Kso2eoJc796d3NKwLGN1pmyX6R2JePXfkJcofukcnqK3A/Y1
         /NTILLj4JU/n66Z6h2lcLFKw34ZFrG/UTRkv/RiS7z36XUmgpSSJGkYsG5OXncvTlN+n
         /GnpTV8Yqjt3L1+IO3qod4av95pxX8QhOJbsEGe7K+CKzuoD3UJ4w7cJ044+b9W3UCaG
         4cXopMxhGY56URq02oz62jsf6bcbHyxbgvUcEp2ZP+QF3N03eZ1F5ULzrMVYrkWISYQ2
         KCZqnWMFEnV5L3sSoyXtLLcm1rdGHZOuhhf1CTcfvnvxcJo14RBs5vJ8RUtcGJF5vlvw
         pwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328750; x=1771933550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAB7LE2JysozOKo5lhqeqihEjyqZrs+8+jW+etQdq2E=;
        b=eZaW+KIibBHAputFEYoSDhYePSZmFBasp7x+K6YRs1IvRDBLzvPaMZY+TzePxDOTp4
         129oDoPPlKKTX2U8BM0WBzw+7Xhv2dVP/9UbTAg1f1PQiXLaBxHdOpnKabL7/ENl/ani
         84sVD6kY/f0vMxLDss5MI89p3TUSC72MbOXCYx5sqMfTDBggaJh3LsRjdl1XdyoSoYK8
         Udz1aUM2WEB6/Kl3piTxpqdbvwZ6vuc95Gu4ZgajOnPJaODdX5bXyeRgnyIwuzuIWjOz
         fBydXrBIUMv1vlwNVDPmqpc74wc6murb54ut9L0wbxmDQ3aTu8/G7l4vCRP3qf7EcwU8
         o/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJOsrrDL39BG2UOx9USQBXXRgEPoePomxK/aiAaoCsHwZX1xznrUW6L2mnB/mA2MsVAP+rNvwyHuMAD6b@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mG5B3jCPHrULMzRLl5W28MX80fmJ+v1XsTrnJ1peooymU9Fs
	ISI6PdvxbVEsSt9La3q3goPPdQMvaCx8FTAOJD4lf6q3s0olbQ9WwkPVVYTmwdlZ1KIhKTMeIxE
	+zTtKEHIfF72w5/LW83TWrDIzUyWJKF1dTUkgKx/+WRPgfI27nKQ0tyl2+pVzuwliVxpD
X-Gm-Gg: AZuq6aLrvqqV4GxpGimKMd0fj+VoDz/SB501l+ZtZGY58wHth2nTOIhmPE2/BGGX3WS
	Xp8H3UbIC9ZLvZFuHXZKZZqxv/EI15PQ+ksu87Npu3l/NyfM+REKTDNEdj1lY7UIAyfJhB9w3zG
	uv4j43hWHLDAPf+ZXRgnLVRACIh073IzbRA9eOPtFBOBEs93XqGfdRWId/lt/haFOQmkvmwq2kJ
	xQ7NVgVZBOz2g5w04in1L5jx55HNv7VEmZplaOA63K9Q7qSp6u/nBsghrIgcAtP32TcGhooZslq
	87629zR9wZsS7GsAALDSzeVebbRgVmqA9aR8a8dm4y6+tOlQqGnUr+FvWpQg72ASrypIZ147KMc
	i5UvYKVd5pVnpuf5eN/wt9Cut9DHNpozJhUwZ
X-Received: by 2002:a05:620a:370c:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cb4ac9e4f6mr1413711885a.39.1771328750370;
        Tue, 17 Feb 2026 03:45:50 -0800 (PST)
X-Received: by 2002:a05:620a:370c:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cb4ac9e4f6mr1413709285a.39.1771328749853;
        Tue, 17 Feb 2026 03:45:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483740be167sm306562045e9.15.2026.02.17.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:45:49 -0800 (PST)
Date: Tue, 17 Feb 2026 13:45:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU
 devices
Message-ID: <z7oat7z6qpcjjdjqevqny6mebjzrt642vnwpv2l5t5vlwjfseg@t5alz6mpptmf>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-3-0bb95c590ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-3-0bb95c590ae1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NyBTYWx0ZWRfX3fAwVDqfxt3I
 tnUNQiKRZqnFhqnU6ANqwQQ1arDvr6zp2Ffb89HYi0RsAr4lufMmb/Wyx91gK8x2vC0aNC2fL0M
 L0NL9uMG3zFA5LoWTLtg+YF4EYg7H/v3z2uKcRh3lBKXNtKhDHHT6D5MEpWVfG+2bgLArTsf/rj
 d6YwZrhIR3OkJIaMSA7O27fNgJYPURC+WFEj4lZQPnZJLjc72lB4vd085B5qIINhn+wi1lw0pnR
 5jVSPbSK7jAdf7tVkCCpfp3JbGHMPzZTp8njQ6AFpDjNoOjAhVu0XIOwwLxRrH5T0iH86NoFqUV
 MlYGpoiqNHT2g8UlfQY2sVLQ5mmmYQbfxufyMQd05muIvTknDLSqax3xe5gILf0JyW3t/Mckr/g
 GZxce2Od9Yf+QIGimK4JrvMgt57dqUXeXolnaTtP3yPQu9sHKLJG5/Rmnx6CM2Xq6bhWx62Qzih
 bf9GwZI7sYwCgbjHkeg==
X-Proofpoint-ORIG-GUID: 7GxXFGKd3zW3bL9y3UtyvkCWaCwBx3m2
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=699454ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7GxXFGKd3zW3bL9y3UtyvkCWaCwBx3m2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93134-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58AED14B899
X-Rspamd-Action: no action

On 26-02-04 10:22:03, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

