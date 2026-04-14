Return-Path: <linux-arm-msm+bounces-103105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HzMEZIU3mlBmwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:18:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24A3F8903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4728F30CF438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF2D3CA490;
	Tue, 14 Apr 2026 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCAKh5En";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdD2oiJi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC52E173B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161356; cv=none; b=Vq8Hvo4x3okWcusqL0HWFUJB3MCZMmk7vWfK9Uc4ivCD1FfNA2w/hbloewdPdJZXTvOaRFdSY6VHREwJ0wt8+aA452kGORr61fzXnvqTyUDcw/lCmi7oddi9ESkYcDvYklOwR7Up8pveVsr/lYLNs5UBdfa2fug3kDegW4Px2Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161356; c=relaxed/simple;
	bh=eb2dScdTobRIzTNrg7rH9VD7GbMZSAJZR9XbeLlbpoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGBCb7qSrfD4Y2ZZH6W9E/wOh/ks/UAsYz0+aTY51hNFEfTIpRJu56iMkcsDScoL1g6RKCpHIO+N/Lxl9ejA16x420SmIdilZ/4rF+sA/rHrJdIZwkCl2PaUjt9v/+oqBMFtlst1BV6MCbI0Q/DYmsNPxYaCVmHF3EeOfqVtIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCAKh5En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdD2oiJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6eefL361834
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Od9oxCYLYXg/AT3rTTCT1li2cBQUhizNd5NV+5ynV5M=; b=KCAKh5Engfkpu4Cu
	FI5JsUGQ1PUuQ+5ycNNg3Jwjj96xoXPtM4KDwEl8jr8hYhb/OGJWocdVs3mg4vbK
	XT+U70AK9aRYZql5Y1zAUaEaeJIAih/tKyhQmdqZbJBYa7cigRyD/FKY00co0MLm
	kJoRpo9S4dm4JHzeCtlXBGACAZTMdnNM4CozF9A0XkcwBca2U4u+6ZUWWol0TZM8
	7JT7vdvii8REHCu1bdaCDl2XPPle27ym8rigHcZTbaX6jFsdLOtzEMuydmvn9nIA
	5AozK7OJYenK2juB7t3PqeG/ngRnbqeexR9Y/I3btNKutXz9eVstfDMdd4Vh1HRI
	pVLQ2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t848-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:09:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so108439585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161354; x=1776766154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Od9oxCYLYXg/AT3rTTCT1li2cBQUhizNd5NV+5ynV5M=;
        b=AdD2oiJiKPIc+xpf5fa3a0w4OeQdpY58hB2CFK1vbbw6IQyrP8p325xwCNvSO01QHZ
         E2HOtKZQmvfM6OxnW4eIqBt06u9eqyPnT+O8+9dtfVyMgRjTytOhqteMggmkTk92qRJ7
         3kFY9eQgJktmM5r7d/jVVvN2LKVZyxBo6opg7X2m/D0EYeow+8JHh9/87UjLVRoQHAjh
         O3EAIN3HmqRnoZfryrJu3R/jmQ0/B3pZKJd9AMprvPFyQ+6YJa2BTH6hUy49a9vzvj2C
         OPGNU6rm0pjL92dL5r62RgRyDM9MGB61S1tfxUx0dqhuucBGAPo//COxavYt8xfVZOJG
         d1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161354; x=1776766154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od9oxCYLYXg/AT3rTTCT1li2cBQUhizNd5NV+5ynV5M=;
        b=mWCUMPtYo60M3xgy/mXA22MZRB8lC2gAsK49bd8Do565fMdaA/6QWUpFRtWcvCrBGj
         6SQ7L/9adSBKLoJEDsRV9DydQqrZZRTGKdk1QJRkGNO/apQHsP5B5n1ZjWLWAQBc2t80
         s554hKVzhraWNW1LwdsGhMzdfpXmkZuIZ1mXMRxKAdQThck4gOHzuG0T4h7poLgkrUHV
         VXvgWywHGB4xF16If5UYZO3qHEtGXT2byJ2BU/FauJYMDVVhYQtlJ0hL6/hjy90lwJgM
         ztiL25FoIsekje/p/O/9tWrQ8gFuUtS25SmH6PqgJ6FOjirMAA2jMnaEOpJDkwuVE+kl
         BcVw==
X-Gm-Message-State: AOJu0Yy+Si+HJm7AHg7Xijj46LF0ZMVAF8G0DPHI+nQlen+GqEhPr+rl
	UpoYV0ZUJPnN6tnqIljkBmR7IUTseEUZm+40/dQvEi/MKTsNQOcXORwH7uvt45pU7EUseqRr8Tq
	vVTxukCZFSJEnUHvuDQEQS768jrz1ORZ8l7Rq6XZpoXGnfLJNkFonqiCEwTI0uJgLJQnrkbvErW
	b+
X-Gm-Gg: AeBDiev8WTeYJYfeNlbMnufYvLFmCSbT/+e9hB8BDdqE+0oHgiGNxsJAYSza90oA7yI
	/GqX0KlGb9UArISQyZu1o0sHTInE/JdxW3WSoBb/nZM2KK1oASMnKYQ2wNsoM+slFDGjXYyZkTe
	6hDRgIm5T4INT9oiG8GqhvF0ZsMdXBWY2WenMvxI3G7IiKmN2r5Qzmb9+3upCQmdyFVpJk4jn+e
	XIaTPync9pMWMScE2sQrhLjn/YlZ13TiCAHa7zrMS6/ghl3gkx0gfE277rzgIeSFZL0/1FdBKl+
	1fS7gncnD4shaG4jESdgJmFpqkDB1ic9c7SOP+S20HqjYAWYcmr0KkGPzDrCY5bWAgsXhxOwYgo
	Lz2hnwm1ycp1sN7o9q4JV1rMjPsndERP9iXIqXimOJdpsD8RHid7Ei+MyR6Fz5JM/3dIf9pzBNx
	XjvItIIpwdMUPdzg==
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161855621cf.4.1776161353991;
        Tue, 14 Apr 2026 03:09:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161855441cf.4.1776161353597;
        Tue, 14 Apr 2026 03:09:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671c4f6049bsm443997a12.13.2026.04.14.03.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:09:12 -0700 (PDT)
Message-ID: <78e6162e-c48a-421e-b379-1bef42685827@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: monaco: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-3-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-3-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de124b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vlsdytxVHXRVqql0IiUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MyBTYWx0ZWRfXy695Ybix1Z3v
 wBpLkNFTHwc7cRkfiETRPLhxv5uM4OkAbnCCT+N8p1ehpIVVJLqBiWDvdwEj/uEie3lRUBxdW7g
 2wi7Y7ckdGL3offGbTtSt9tNzhTex0AG1DhHkRCsWGCbopnTBOEtykJmVNOZzzPbRicO87WtDYU
 0mP3TDfA+b9huZHtW0deUMJgifWFAWGpmM6HNLDE7HMCtnt2o5+y71g0zafVKxti1r11atRdPoY
 gWIvDLRsBUccoPGN7jav6QmVwu8O85oynCrCxEYHEzAN9U30CeG9FHP/lXPTXilOLgVRUhHw+kz
 NA9ccdtiuPBp9xBeE375sV+ZzmJEbpMUZVk/kPvcS9r3UG0SEosjeeDYmo1wbUauC8RmPNXdNjS
 6q+SsiS8gr1AMDRM68EV/EBHfxsRFQubX+Dd54bwXJclLqY1H3WdZhjVw2Mw3f3g8iFFUjysf2k
 PpKEQ4EgGpd9ssTINtA==
X-Proofpoint-GUID: 0JPuQLtwV_VgbYvK4_esoHWh9WeWtBfv
X-Proofpoint-ORIG-GUID: 0JPuQLtwV_VgbYvK4_esoHWh9WeWtBfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140093
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103105-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD24A3F8903
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the monaco device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

