Return-Path: <linux-arm-msm+bounces-98227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PnTCQ11uWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:36:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B97532AD223
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00A79302DA97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A0624B28;
	Tue, 17 Mar 2026 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAErbRJA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0GL/yP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34F3E3C4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761802; cv=none; b=WWO22v/3Mfw1iFOCEkBox3pJ9VpczEI8lAwT/QzhcrYXk5ENT4W+MUrRlnSBGQldbBdhZpiVup7EKm4svNcYlQ2Vll4hEpWHvtrZp7zTrAvfRc+9S3wV4cO8OheYPfTlc4paxS2niFFvdnkx8SUC1qG48f4k1OdO6HXb0doin/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761802; c=relaxed/simple;
	bh=7RXrvxKuafwzTyKn7N9zykMDyN4eUka5hI5FHfTuWsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGOQX+RdKA/QE19XfXJsseGDEl/W2YQv6Apqna1AE4hTqhajH7Jz1kDCDn6624FPPuCVuEJ3u9VKknSS4oYKlwGi7uqRQTZE0ce/FW6kNQ6qmiuv7M4NQ4nhFu7+q5T8EVjE7nzY10X6nlVyh4ISEd+8qoqWep2sJ7xuqg6NmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAErbRJA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0GL/yP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HEHpKX2188398
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3az+R7FjstKRGNCn3h8lzdnGp5mZtUoEec/3EGXEOnM=; b=kAErbRJAjJRDxVWe
	ziHA7eZy4b49Ck7IeW35MQEWiG3c8VPILVw6e8kTIiixlnaGBdHix+ZUNzQ01RrT
	a8L0M64NhiCEGR7Ll4EoDbaHUz2hbxE9EKKqNJ92XDVfRXHrMtujFAFYUvyORx3N
	2y0qxUrfqB8LsyBnwWT3YFdbxmUKxLvPdGjrORvulvRU4mo4fwNnvng8NmNlQxUj
	St/BRan2FM7eskcaQPWEDDfeNHHzfP9t5kKJCPZwTC7CfhbQq7VodSgdZ4sE/Mlk
	Ao60rYE2tihf9SuYGkg7py04M1ukHw3kWHWFmj0Y3QwGeD9pLE9zohdCzdSzb0wj
	ufB/eQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjraqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:36:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so662285885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773761798; x=1774366598; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3az+R7FjstKRGNCn3h8lzdnGp5mZtUoEec/3EGXEOnM=;
        b=Y0GL/yP27WtzgGKxk79a10OBiyE/Hi4mYuiJO0EV6tplHMf1dZQNcj9QsVlHbOd6Cq
         bhR+63AdzrTvVPD8G8kM6dQR51cTu3VzDR2I/4uM9gUp94iJ+mOLFhYqgapBV63eeYFZ
         H3CcIDAHjw7jyGhSDif3jdlYtLQz0QEMJHJpKnBo6FZFMf7owtLjcEgmADwrXNU7zsov
         wtNRWkrwxu4+qmCYV2AhMiFgelGDPZWVYtt8HNvOyqUGd4JdUr6ETzQQACFvbFkqnORx
         YxLMTFQMBGelXTYMJTpL34Fdd5zbilBgEFKTotp02+BNQUFYqqXuV9Ds3mwUnBUQRZVB
         ksiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773761798; x=1774366598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3az+R7FjstKRGNCn3h8lzdnGp5mZtUoEec/3EGXEOnM=;
        b=AeZmWxnsEqfRhfKcrNaxlOyRbG5bM5nizXfvjSPGkGdkU8TkX0psIGzDB+DjeyvDg8
         0k7XfumdFti6gKdZKaar1FMBGlQjJC74ts1/JMijTArB3yNkfY4O6htzr0uRlRYJcu4M
         dH23El6ZD6sj3+xT8bRkOka15aPhxyPYioP/I3tiwvNP6T+eKB1EMHpOx38+4cvGPf/7
         Uu4nTwiMwVoTPFykRJgav/+o48m4xx5h8Imyr9sJ5tciZ36wpJO2ST3SxJvrExFZ79xy
         cjcpJHHL/sWrBQo2ppbkJ3H+tKMA6AJaPeGv2lq2TQA7TMYXnefDEwwFOZAOGBNbl+d3
         RmHw==
X-Forwarded-Encrypted: i=1; AJvYcCWhVUQvJIqcX1f1KYYLPuetUUrLpuLnDEDmi9VCq+YFJLTi8zCmeg3OKEVxf1CSMw2YwIIQ7AYAYesQsusA@vger.kernel.org
X-Gm-Message-State: AOJu0YyRJ9q+Nii7KIcS7ZnVMzVIhws+04fe9xNx6jy10HbIWKE/KgtY
	wcLQkIVBXvMEFi2xVjZk62ou1k6q1Zt/1Ufei8cfGSXrMbai+nqXGyX7/gMbZf8SU0mGAb0TR+g
	NMTbRVMaCec/ENBpHlnIQz7rqe0hSGmHQfUZGp8TxwJB4j3S8v/pWG1Cz28pDREooUcZg
X-Gm-Gg: ATEYQzyuXdj1VUtKYnqZ+7m/v1zQ6FvjI5PbHA4cY88xqeG/kEmkWEv/jXBDpW/EEc3
	tlBglTMHOht5PBSfRjO8PVlOQwVtOCgFwxe29Fmw9iQjq152Bn2Te6MMoPMIyew486NscuQw5rO
	2MbK6vYzpwk4/QFtD/ebGVR1bHztvX/PNBcNoTu0g6LLbkKrHDafIlRxMh/Z/+dbwdK9UChT7iA
	NNPZnVihV1p+6wtU5P/aVUD3X2dE/rxnQbhBzn6qzAMPwEfPd9CZwJR+ruA4qw7oxsly1FK9np8
	M3dcplkA2PndOA/JGX0tiJGfgVk7Nd6x3gFdUsiTPEtP5bZJ54aVfiayF79EHc7nRkCU4sImNI5
	gIPEIivdrKxWaljcfxVAGRamPIYOFQHOifMZYmu2/M0gmqo1zhZ90R6O76aLaMPwuNDfTh0+h7P
	Y9QOLYV/nmfEUWaT0JQ0trLP1V+pJiG2yBFEM=
X-Received: by 2002:a05:620a:4613:b0:8c8:753a:7d9 with SMTP id af79cd13be357-8cdb5b6f808mr2359211385a.66.1773761798146;
        Tue, 17 Mar 2026 08:36:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:8c8:753a:7d9 with SMTP id af79cd13be357-8cdb5b6f808mr2359203585a.66.1773761797516;
        Tue, 17 Mar 2026 08:36:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54fa6b8sm169601fa.42.2026.03.17.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:36:36 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:36:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Pushpendra Singh <pussin@qti.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
Message-ID: <y2tv3pzuf7jiouqyo3p3cohfcqwe4fpomnr7pas7dl6uinrw5m@4tuckiojir3e>
References: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
 <97890f38-2b17-4591-b5fe-cc0262f944ff@kernel.org>
 <39f51659-134a-49e9-9b44-cd67cfec0dd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39f51659-134a-49e9-9b44-cd67cfec0dd8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzNyBTYWx0ZWRfXwCkiSghmJ4Um
 hZ3XXeGyRXp87VbAawoEUOED6aL/oscmGbAabTOvPYICujaY7HNZo2cHNdw9esPltqajjCybqNh
 ig1p2PMTvMQucMyn1nCoIhT0FcT/fRqIYJiHPUNP1JG1MU/yHkTkasicQR0QazRmQ/4n5ph4B1d
 N3QKe4aFczlu0Ns25YcJR6pv+FFDY9LUU+RPKUr71OHRYazlMniStORQkLh9LoU990IysgjD1RU
 Yh5E7mlU+rsKwgC4tPSrI5x4kPPA5L7MFhOj7g3fjHKsiFqNYl9aeT/qvFZkurWyAbHnDTBLY2J
 YdEIQEnf6l/nfxHynrfeap5sAUIeDdXumY1OeXEv7C9WMxD03U1NETBhIMGElLi3MFaFnPNSunA
 Spo/VmFHiII7DVlqPUP7uxASe1P7X+90NYjeXtaSLn2lv1SJJlrpQ9H3MCwMQb5HLUHDgTn94kg
 0vUtJq3fkjBYPkBelyw==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69b97506 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=Km7XDCs6zAIliAjS7AoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: REub74Ql9SjTynEfA_aH3emMnLHyrNMd
X-Proofpoint-GUID: REub74Ql9SjTynEfA_aH3emMnLHyrNMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_02,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170137
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98227-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B97532AD223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:15:51AM +0530, Pushpendra Singh wrote:
> 
> On 2/28/2026 3:19 PM, Krzysztof Kozlowski wrote:
> > On 27/02/2026 12:10, Pushpendra Singh wrote:
> >> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> >>
> >> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
> >> vote after 3 sample windows instead of waiting for 16. The previous
> >> 16‑window delay (~64 ms) is too long at higher FPS workloads,
> >> causing delayed decision making and measurable power regression.
> >>
> >> Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
> >> jittery, while higher values (4–6) were stable but less responsive and
> >> reduced power savings. A value of 3 provided the best balance: responsive
> >> enough for timely power reduction while maintaining stable bwmon
> >> operation.
> >>
> >> Significant power savings were observed across multiple use cases when
> >> reducing the threshold from 16 to 3:
> >>
> >> USECASE			zone1_thres_count=16     zone1_thres_count=3
> >> 4K video playback	   236.15 mA                  203.15 mA
> >> Sleep			    7mA			        6.9mA
> >> Display (idle display)	  71.95mA			67.11mA
> > Which hardware exactly? Which kernel?
> >
> > You keep running this on downstream, like a lot of code from Qualcomm
> > and speeches on conferences, so I just don't trust the numbers.
> 
> The numbers presented were obtained on then upstream 6.6 based kernels across multiple SoCs (sc7280/sa8775p).

Please don't use old kernels for upstream work.

> Also, please suggest benchmarks and other perf level measurements done when the number 16 was chosen initially,
> that way we can ensure there is no regression.
> 
-- 
With best wishes
Dmitry

