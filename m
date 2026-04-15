Return-Path: <linux-arm-msm+bounces-103257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE54OhVa32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:27:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E90E4028EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60C4631628B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F05C324B2C;
	Wed, 15 Apr 2026 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSkYBCz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4/1Tj2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4F335072
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244918; cv=none; b=k2R2rNNTJRKv5nc4Ru2LJ2XE9t1QMXWc2pT7+QLBGKF6B5H75utM1kxbb1vJNAk4c3Lce+GvjqK+4mwas35WF6L+XSHJd8lk+I1wtRptt7rAY0AW1n3CISdRaIAnBvnGKLeP+vIBOjmYzkgA378q8m3Z81wvWFi/j1lU3Cx3Jy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244918; c=relaxed/simple;
	bh=m1j5RrINyAPI/P/EuKGdbzHcBA/T6Nxv92BUQnlb+9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJSUIu+C7FnFNQwKtfSGQlA2NMNajI4JOw/a6orVAwSVsnJp7kYAOb/7dOrpky1f+uOrnot/78gY2FBE0/bD6GfgFTk8wtC4ow8Ddtc+V0GnkfEUaSTZpX+hZRWBoj2hTXEJw/UXR72zd7TNBldtkQYnYyCZuuNZCrnjxdrmKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSkYBCz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4/1Tj2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9I1eV1565936
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=; b=nSkYBCz0PI4jpuLI
	03NG+lpyK94vsqez/9XUytSqMGZyAkrFBU5+j4baDy7CcrSNZCUUjEvmqRs5HcEj
	KSTy9aXUti2mIThk7KvCND61IzBmZsdNXvK3P5u5SOuPSL7GCoQriUNQe6NVJt5c
	y4ScnSy2epRuacXe5D5f3+SzoYeD4JD5E4f9i80BnHQPaGKbk3uDR0un8FbxOfLJ
	IAajn33dG9irrwwHQDnBUVUMx/iEWw1pxiKI1XlV6OM439A81f5KtEEyYJ0G5Cn/
	JEzd1hOcqqUR6QEUu0X6zO9hPRBa4+487jlaxK/sJ09TqVfLsHo2pibAod/2m5pM
	yoj5NA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv00du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:21:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50dec198720so11495591cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244914; x=1776849714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=;
        b=F4/1Tj2objA/eNd8dodnFf4IL/mpYNtw/GU+LoLeJr5QMRP+RqhuVdbOI8YA0lzFKA
         MwxH3wLJ4cCe+9+nEerPszV89JFkKZobJ8HLg4NLLQiYqCXZJueMKpZm1Yj/Ir78c084
         gS58BUowCvoG3UNyxAjuGLfMdWcA4X5n8Zx73d5Tm0fBhgc0eFgihYqmHboEIhHVDHCP
         3mOzhvmcl7mmYYwgNn9LhvFIwi0SeZSHefONdDWzifK4/SZnHr17liBPsknBO4IyBJr6
         smdf3O2jDdSFiWe9ZDSMbvQdwQxAYvnzYrk07wAbm9wgO3u/r/8rCz8JEZw0E/EJJLGS
         V/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244914; x=1776849714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq9KsmafQwglhK4UF55U0warrVgOdBDQ7Wf2e8WsH4o=;
        b=SqNPR9XT3JduFmHbkOEA1jkeudPpQEEwuWlyX1Wg+21nI5szlxx8jY42BZV3S1xZwh
         9WCwNtNJuVaXygcHi3prrnWk3UJu4ROk7tV+1l8aRuMndti7rk+XzXWxsv1kbHrX64/g
         asWt3+AnkLJ/rKvNY3giGjP6gyTDiJhKAKa5dgUNhirSjPs6WILo5XW7akCmgIxk6/78
         N5shFJCe4AcDjDvW5Y0E8OhG5Zy32Xo+lxZAc2wNv1QVcl61CcUhcafjZBm5xnnYrARW
         f7RKEUp6tzfNbqSU94tj4FJNd3onrSMf42vk1+fLd4jBKGwh4+2oXY9vV85oa4zmJezQ
         jVhw==
X-Forwarded-Encrypted: i=1; AFNElJ+lRP1wUqKJlT+NAlPYRpsIUUwO2XL/EEPzWH6Il/eYb+ZIfo4c4jeKAcn4gHXROiE4XUGqiluBUXanNk5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzgyfhUgw71iwsrhMy2Yzmi0e3jXPG3MzNR7Yx87FZUgUvQ/4BJ
	kM5Txe9H3sdp+dT9xxkYUj+5LxJkCBtN3av+DXa66Pa2+VTjf4ZHOdhQMp17nmOeN6T4HPaL9pa
	JlocDvuwPJlKNPRmd3Bnogb6UXBjHBxWgIzakMYGRjxxqz1Y7++jbP5dF0eHiwcKvsyT5
X-Gm-Gg: AeBDiet2ICu6QUKLiO2FZyaoqsAdeGj+0QuJEOS9Pui66clav8yAb9ozTJacq/y72kM
	0vJu7nOj53gM+NUfH9gD0M63zD58poXyP4XpQtOSm/f9ZEa3OsTY25EEMJmUDDL7Kg8qCi7N/sP
	YQf1PRlgVoO37+w2KHK0Dq+Xu1yF6rovHQlsCWbXashisnvO43oyr8SJWXCeprqmo3510QdoCEl
	Lhy6Ao1jDvr8vb+g7hS4mlXnJoyGpsErBn2m3EKUJTAekcucrQ2MWyVaf/fxb77THk8wDERV4wE
	gWSiTFUzMB5x1sM9a25wzH/op8TRQCG0eNNVFpixRuOHcfX7RZieLOidsZNoKINdCJkvKADCwHo
	1+oN6D2Tm0iDruJ5uWBc7RCe3RwNVWveUTT9Vxhu/xhHRyb5YAtungL00wKu2ehNaflsmtX5rD/
	yA0PZa5Pk4MfbB/A==
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14926081cf.4.1776244913830;
        Wed, 15 Apr 2026 02:21:53 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50e1a703e9dmr14925871cf.4.1776244913330;
        Wed, 15 Apr 2026 02:21:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c351fsm36204566b.30.2026.04.15.02.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:21:52 -0700 (PDT)
Message-ID: <228866a3-ce00-431b-8408-95309033bb41@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] ARM: dts: qcom: msm8960: add SMSM & SPS
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-8-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uPeU5EZ9Qn3unenOEy_O_uF6lqWR7gW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4NSBTYWx0ZWRfXwVbehAFeTcRy
 un+1wq22nH+Y7YTj+19HSGPMRL5RIYmvpErLk7WzwA+p0ZnDBAfjbmi4j5i+EuLUtIn6mdRBgw1
 sg4qtFeyqh1qSmnGYJpr5IiRh7FQwX2mAtgDao6UAyBaBiuDfAmrDpShsK/+OCVL7m0h16vaSjl
 8VotfDBTTo9NqkmSZFVoyBROuUSYbB37pVknDVu64KhSdvOXfm5qhS6F/1/knsdZJVDjcMsfI4f
 Htgev2lKBP1RiuyZf170eLIJlJQFeP+rZLuhnH+o2sFBqNUDQynpQFtLAZuDfhp2P6qCs+7ptU3
 ZZS7+pfWH5Xd4YxIsKN5idBoSf9eWUof57UvarwVXU3bLXuKCdkKOErLJJ2s5EtBWnIFwT5xRKN
 3/MIurfpQbXCxZFiLjr8OcUQC1m+TX3FM4tuYkDqcd8j8a/UqYfcVTcypL5aLAvi7XQuns1YKOC
 tUuHHOdGzBaMqRFyaMQ==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69df58b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=he1q09Cc-XUdRE8H9dQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: uPeU5EZ9Qn3unenOEy_O_uF6lqWR7gW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103257-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E90E4028EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Shared Memory State Machine node to coordinate state transitions
> between the Applications processor and the Riva subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

