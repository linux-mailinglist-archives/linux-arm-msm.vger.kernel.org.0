Return-Path: <linux-arm-msm+bounces-96804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ9uCqTNsGkKnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:04:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8525A975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC4133032D25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECA23164C5;
	Wed, 11 Mar 2026 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyitJOh5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuYvJbOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE8B2DF13B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194655; cv=none; b=Ah/wmQ1Dchg3B6c3IZ7eiL5RtkPT+VIHHRi6AU7WsVdyvWIIJVyKF4XBu1IJOBwWx0HDdLSIF+b4WpPfzWEYQokqK0eYwtSWvHzA8scCU/5wg8fqp122DeZ6AeYy5VYCeNH/DilHdExtijKyMwQKa0ARjMKgNzZQlxvvn06evqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194655; c=relaxed/simple;
	bh=KHpLEJ68eQFWkvR+yjWd9+m47G13y/6s9vJ/u0LOTww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsdjS8EgttuM7M6mdSRRhb7jtuAp64qr7HMP1Uqk3r9d7GAOu5UCoV77wN07BZ/ozAk8g2X7GBqtz5/+KWTkIT6H9rXYAzSRbgXM9sNuLU7aKaBgoORx4gUpsZI2gJT6E2MNmfhShbrU/TUO/Dpq/yPzv1kT9kjI1Pty9rtl63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyitJOh5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuYvJbOf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHCmjW1572954
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=55ZluhAsUgJCp1Aiy2a9rkW3
	IsaBNQFJQI+2xoKo9q0=; b=GyitJOh5XG3aUJ1pASJfR8XXnebSCDMX92yIfMIk
	l1yz8dK+0qVfuOGvDuH8fkw73l9d8v/lXZpPcoF6fiF8MWf3HOieVLHJNZ0YuYvO
	LNVBO2DWmNGuvtRCXGB3UpocbXsmf6fcVkO3iTFdipzL2NaXDpzm37/WIEkZLqe/
	Dp9FmoktkCjBq8ELIPUEKkH3Ij2tUDytehIEsBk5rezB66aUuKzzu8YD0qX3ZzfD
	hbDbPD3IdDhyB+ecRiO9NVpPRY4XhlcarnUI1QxD9CPsLefxG7svikF099K5vkgV
	daWHyPZTCrX+4X8wwmLMAt6311/Ss41ynIswkLuphnzbfA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk9h1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:04:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffbbf0e3easo7339111137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773194653; x=1773799453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55ZluhAsUgJCp1Aiy2a9rkW3IsaBNQFJQI+2xoKo9q0=;
        b=JuYvJbOfjCdGqreKiD6V2xxjgIxIqMaK0ISyesB9yUN0zIuSt4c3dpjWlh9RMZEO1F
         tCbIcGXxEf8ok4n5284WGMdeN2U4r2odD/UDQ+DaEalMZ1t06Ig17gbOKkCR+QugS1kC
         YM4pKyGP8DoK/8MNo01Dz+Yu1Y/45ttXnNJmlgroSsNjpe05DPxb4X696yyTFdrKOVJA
         LhsaanaxLp178k8hNagcEQNQvnh3jZ39BDMDERd04Gsj5YqZCzt9HthikA6VE7qXJzFV
         zpx2CpdotlttDh+DesjGsWp5qnd7k7kZYsBp9WcFtm2boT/bzE4BfMZrpgQiYXzp+nbH
         TKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194653; x=1773799453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55ZluhAsUgJCp1Aiy2a9rkW3IsaBNQFJQI+2xoKo9q0=;
        b=g8CF/Pwrksr2Erjtb31AIgASWS7MOSvLLPjR1lp5mAF7wfK4TdpYvD4FOnTq+tUmR8
         fTqvWcjoU18jJIcyPFeoObGa9qit0AVoTOZwK0kN+UhP0JpXLTWgc41p77kKyOqSDCtL
         m0bXD4codmaZHfxEdmaSGmW5mu7xsTipEpMZ4KA0OvDWbiVpJKBJN3MqQhEs4CgoQY4V
         tPWA/lWEDu2Je4Yz/5DelBB+QdcT5uwLxe7XP7dlUuxtQOGOs0RD7QV4Qicg8UzkBw65
         S8VrIXi1Uzk5Mjoy4qi+EyYaFHn37Tra/MDEC7ITqxGKmDuUcD5ZYsJ6oNathcrlp0ay
         A1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGu9kdPNdhwwSozDmw5FYB3zHu1tWt3zdyJHePVVytmaGYEIsUXbfPO1AlBPqHh4mb4r/Mjxq0vHn3vQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzA2ZnhmbPnIgiJJe7sKZjBJtnlBkO36pAJ7tkMuoQB4d8s50XE
	N8cOUA2k6FFNVpc58X0wilrQkN3O2bXszvT2/6FOK6W7W9keQSghX8hmEY56vvvh4ycQcZYFhV8
	5eF8NioXtayMIw3w6beuKsjZvHSWTN2FG3TIDypt1HBojUmaW2IS4mcbYJYG3eePReblr
X-Gm-Gg: ATEYQzwf2XRQA4WHXvxv4rrt+WTpAUnWFNzwGV+EP1sOo6ubMN1ayncEB15hiuEKgNy
	qiiSL9XWNvAXoJBp7CyADcF3UL8lQlcPtFzaP83vI/d3HIsISJv5R/WEY9ODkyMlKOE0As239lI
	p1HQTGtPVarMzXJZCTbWfPr4T+COMV1C8TdA6VwzIvgAU3aVxl1tloOQFkB7s59HyJxFYWkszID
	GuMmzC0o1sBciCJAuZDkwHzMf7YDzrxOpgUWFbTR43DcXB5KswYzgb3xIiYNR1VsQobgSS8shrA
	1Gm6hc4Li2nTn1JA5RnKYhy3+THmJYFJXSJbx6THlolDbCTGaoB4404PWhUsbf74HH2M/R+vTIT
	yNFwVySNfD4P669Ds6j0QnRYSPIGnBJCYpy9b4GCazNqX5Xr/qANFtK/ufFmih8ZKp/dq1Ix/9R
	dK/CoyMY1K4fK0dXyHg0zxq6Z7ZJ04P4JdTxc=
X-Received: by 2002:a05:6102:548a:b0:5f5:2ab7:cef4 with SMTP id ada2fe7eead31-601debc1b5fmr415388137.12.1773194652615;
        Tue, 10 Mar 2026 19:04:12 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:5f5:2ab7:cef4 with SMTP id ada2fe7eead31-601debc1b5fmr415366137.12.1773194652157;
        Tue, 10 Mar 2026 19:04:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm1065081fa.22.2026.03.10.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:04:11 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:04:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
X-Proofpoint-GUID: 8d2yZneFxZDRICjeWUZ90OknSer1DAL1
X-Proofpoint-ORIG-GUID: 8d2yZneFxZDRICjeWUZ90OknSer1DAL1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxNiBTYWx0ZWRfX5eKDTULcnRub
 BOFTrsO37SPVKKqLCKGDs6jeAh10sGhxO+hAe3t4bZyIKLapb2EUAUJ6Lg4ZlOpz++AMu9Ij05q
 2T6jj2WtEJfGvwHOPMhdh/bNAVRu8v63vtx+TzGxfSdqsCq7fp8ubUkOXzToKnlOccAR8StEVAU
 RbBD0U5GsAmsfz9ZkDvgCkAgFRKt6h5XuOyK/yg9gHg26HhDqNZfUXLhfb4LcEXy6sPIpG5GOYk
 796uiq7RTh7fqZRal2R6sHKkzGveli2o+rYHCIu3DcnLktHCD+/FTcse3pW08dsECGXKDghYaiC
 NZns/vd33fQ8jv+cazR/rexQnYhlooyY6ceFexCToTjdNkZm3iDZNFH0SDRiGV7Y4uTObCi5cSD
 fAcnD98c+rirPWPOmyWomyyxr3X2qsms9s0SDL1PwwaMjla1iSlCcTs61gsPgeCu2JA2s+l3ev1
 KZBib5hS+4hdNkHx15g==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0cd9d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QtJ_nAIye8hM5DG0jicA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110016
X-Rspamd-Queue-Id: C0F8525A975
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96804-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>  2 files changed, 159 insertions(+), 1 deletion(-)

With all the changes to pas-common, what is being left in it? Would it
be easier to leave it as is for the traditional DSPs and copy necessary
functionality into the soccp schema?


-- 
With best wishes
Dmitry

