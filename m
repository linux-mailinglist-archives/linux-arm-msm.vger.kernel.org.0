Return-Path: <linux-arm-msm+bounces-96705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI3DBlMrsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F7252071
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 504063465CC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743FD397E8E;
	Tue, 10 Mar 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FahaEN7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYlHId7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDAF1DC198
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151977; cv=none; b=FsAnC1lHZqyBmYNQ7c97EGgBwA/kJanvGjhT414o50/iLdTe2e9htY2y8k/S0ExJUmgpT1cOLR0i2FynTHYBwFrhpl9oxmr5JL+6LrrzAKPpbCA/2NMf9TbYjlY6Dk/KI+x7xe5oxguRzAxH0d9F0amu3H56YjQxnvr6q54YrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151977; c=relaxed/simple;
	bh=1FaIPFuWAfmVNzG9+OtQXpdcIagmdohXDgobkOvWmaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJLajlcn4+r6V4NCGumVY5oukELWiQVpZ7tE2LtNMjhGH7O+gXifUzz2F+n0xtRy95bNwMzsradrBeMRVxadJKjOeRaUt2m6fEQt9r6KtvhnSjb+iJfBELz/Lw3Dh/1Z/IfYAG75AXAzeWE9l3q+qc6LEbfPL9JJF1jgFwSMr5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FahaEN7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYlHId7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACavkd964619
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqvWktqC6//V6Esd6CgK+Uq4ljtYPh/ZuwNGITPaTMo=; b=FahaEN7ngFKMRFZl
	etdudgxLWcSyWAqy9SPb/9EueWGgIiP1tySGYqNLoG73WEYSNCX9qxDFE0uzf1OY
	neMDEFMDMw7UyQm+2eQlRek0cjCopGNhk0xLK62K8AslpiV49P4j9IMDXvSxnkLc
	1NfTt6KQS+dd0R9BmE7ehywg/1m4uHTlheTe3Q5uYA9ETXFBtQ/uzMs4VBmeS/+l
	k8o4jGPEZixb0LHO4dgaX+bTGLIjxELLZ5olZ8a4ZOTygFYtB5ffBYc1lDzD7QtX
	PNDifgNrfuogc4stYiwZwsxcgpZeFdmbF+dEPguY7HYIDNuxEB/Uk0r7NDmUVcgO
	Y/pubw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477khkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:12:55 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94de9282f17so1989813241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151974; x=1773756774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqvWktqC6//V6Esd6CgK+Uq4ljtYPh/ZuwNGITPaTMo=;
        b=cYlHId7flRFS1/j2sjEqYSU2WfHXegs0Xl0A18tFp35+W8g8Hq3nuqEBkagfzJD4Mt
         Sm2IltEC+hQIJ++qKMptuLxPkkMyWFQtnV1NRLs/hViovFQ3ulRFzM4uwt3LK1BzTBZz
         M5A57EBb/VGwzDY7omzpRGKw6cdNfIdQ+MFDvTZP4k4QDeRQcV+5oKokUoZL9q0Gl/XP
         OTdJ5p1CnY796ntM9Kr4Zf7MQtika3a6Sx0c1By1FhVxA35ujofhF6VOarENHFH1gws+
         CkuXGdqvULq5q92L1dbZjpDlqeFAzT/oYy14s9oM+Gz9qZ4ZPlJat8bz+b+Om0g8w3u1
         vQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151974; x=1773756774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqvWktqC6//V6Esd6CgK+Uq4ljtYPh/ZuwNGITPaTMo=;
        b=o0Z5BQ4xqcPN9XeYwG4jcL9+SS4BSLATjOGTi8CsUJUfy8ufbDpytU0nyLVI9XcA5b
         ZNMmyPeW18fadp5iImq2u/VdR73XJ/re/KOMFk8LqsRwwsoLrIfnlhBS50802A+2wcIw
         k55DHhzlxloC3vdMW9yfYsKgCzB6aq9IRbr8cgm45rxGCegc7mYMFI3saqLmDRvgPrOJ
         ofQR2xxLXzJkJXmN4V5XhaAwnGStkaT8Mv/YyxwkHickkE89+EpgaJMJp8UTEvIyO5Hh
         KbD6EKZ6fAbw4D5s0ru2n5SPsUB+Juf8gVtpp8kpjaLR7YI5WWmqI+h4H8lWivR+p31w
         6z9g==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ze9vkqnWkY92q7geTfRKGmGJMziqMHXBuZ0LXIJxv7s0Rf/Sp7bCy5/fqe/63X6NZoC9CTW0X41MlSrq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/GNa2I+Gprg5fs4C5nehWVDhGBGphaG2cxG2iDvaigN7I4+Au
	mMb4qDIgNPjsBGaals1qKFdWNCSXOqV4jKDZ5C1e3zkl+RkrQInD+tWwKQO699ZZ/qIV92lSEZH
	5d52Adt4CqFLzJBeusCql0PXay9OAR0fshi6fmcMh49ina0wrUWuTEXtVtJhpWr0HYxre
X-Gm-Gg: ATEYQzwqAbMrZox5IQf50pMxQk37hW2MhsvTQGe2l3ehJPFI/C81tDNlCGfQZT5qYzy
	kKA9ySmcxZFpgs+4d0d15MNKrRUgCZ9eMwwAZbQKTTpomW6YIWF6+3qUW4KscrpnTF9kBe5Ik99
	+1IZ2RWNirLzgI+EiVYP7HDFOhMCmREtPTpgjG6Q2gIzpiresRdQKW4wYfkNowZ3PoDAhLGGhVo
	+lkJmavPUM7Dhib1UU8OF/VV47Nc6hX28WhUr+shyTkZnrH0mQoBqV9c9MUt3ajRqZLJnZ4o/8r
	6zN+JlB3ydujbhw4/a4LrCpBmgII0xJB71/TKzVdGDoDibKZGaWsCQaaIBqGfx1bXB2avx+i051
	1l9lt5vN2Zcily/caPRsagvwGAYV8ovoRH7zBq5SmsLWYeoJ1wNx2Vg5vrJwVpX6mmmyRjheaUf
	8wirs=
X-Received: by 2002:a05:6102:d92:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-5ffe5ba4013mr2497931137.0.1773151974622;
        Tue, 10 Mar 2026 07:12:54 -0700 (PDT)
X-Received: by 2002:a05:6102:d92:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-5ffe5ba4013mr2497898137.0.1773151973959;
        Tue, 10 Mar 2026 07:12:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm4317323a12.2.2026.03.10.07.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:12:52 -0700 (PDT)
Message-ID: <b5a9e78d-0458-417f-824b-a352e8b4c9e4@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] arm64: dts: qcom: kodiak: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-6-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-6-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXyTVYkpFaVVgz
 XH1RatL97s3kOjqO85DgKrG9RNU555q1y9uHxf9gK+cBCKG4jP7+EyQV2lJTCSPVoY07rBzGbUS
 qCPXe+WoG+3cz1diXli1+4jSs+d3kiv0ayfBixHju3sCefQKcSiN8dNv9fETT7lzxlxTPUbvLEP
 ZCASl+/Tq31WFHwxcx4kIioWJ5tg3ZZXdKuQqN9rEl1U/gezEjvJ07/LiIDS7cAMvZj+ft11/BH
 /vUKDLC2ruww7T8f5regT5nmYiNU6lj8diKuZqp8v3mrvOdGpfgxnMc0W8PgJzf6y2tXFRZ68b7
 pKl5XazFvr7o1fqu6p3PzDXbBqkT6Vp8zzowuiD94yqT9/Cq0bgH9aD4b5LV2lykuRUdYPvozUC
 xYvAg6KzbdqI841sPbE4h/knYcVR0uCHLPDxekXIJ5BlQGOt6DW5qM70bVz565DibNNWz4W3kh+
 yvDqlLxG44/xMI42JwA==
X-Proofpoint-GUID: 7Uog0KK6KKd9VtDEbPLYmn9xwTN3Njy6
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b026e7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=z_dnvKGLtVwtNw_c-ccA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 7Uog0KK6KKd9VtDEbPLYmn9xwTN3Njy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100124
X-Rspamd-Queue-Id: 905F7252071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96705-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On 3/10/26 9:06 AM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> kodiak.
> 
> Fixes: dfd5ee7b34bb7 ("arm64: dts: qcom: sc7280: Add inline crypto engine")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

