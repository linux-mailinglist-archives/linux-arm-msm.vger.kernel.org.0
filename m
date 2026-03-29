Return-Path: <linux-arm-msm+bounces-100588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPqgLyP2yGlUswUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:51:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6830935170B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52074301AD0E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 09:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C9A306498;
	Sun, 29 Mar 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5gucdRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NICyJ7Ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631B82DFA3A
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777879; cv=none; b=WJ4B4676h+SgwTCYp4iDJ5hRscMBDXqQto8GlUxhc/jCCF/X89gozFN4tqnWS9kC9Yv222UrQEwvVnLwSKALS4yc7xP8MHTNnpwWkb1HdulkqzEZbzO04WGJ39I6eOFpM71eVExl0MZDcRlmWi/XDqhhL53yKQUfv1Crn/Vl6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777879; c=relaxed/simple;
	bh=EoIlLCuH+f8z+tfvoMn08R3g/gglMpb45Zl3/azitG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKggl9X+XAB1DMSsKouvSX0f2JFo38Dr0eXGS7KW/ARNIdmp4kdoffmRKrUyMg5e4RJS12uVJhwKOu8ssRk9kL+0GBcIrVU8E1j01DOFLRkwDwksyezvkx8yk8NhwwZ9IgBkL/FtvKxHKOVWiQOVVPbpzIjjqRHktY7K39+YXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5gucdRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NICyJ7Ay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T11lG63902135
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=; b=A5gucdRyVOyb9YDX
	vqOfnOPP10Q3m4zxyIwBITB27ZS6eskfQA9ivlOWadCI0QqMi4Fr1bZ09deHyK4A
	ewrCV6c90DJo6qdsAzK8bm+BtA42UNzH4V3oeAPuhkDv27pTeR9CnzPsc79lsgiK
	00mV0EFlm4INxbxKr3l7Cm9LU+MqVrFAnGdqbufit8Gmhbn7qjDgk5Fl6q7KJkhU
	4VwfRf8Xp35EUAtdUz07jBA1/KkDd86+e2S0NEEUXILIk6RW7Zmzt4P/zTdVlPpi
	zGYZlVvcN7Uo6cx6voEL4JNXrQKBUnn2QQ9Dwm/w1lV/b/ADDK5ym6eIEP2tRjcF
	zSIBWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hadtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:51:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so99594191cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777875; x=1775382675; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=;
        b=NICyJ7Ay/af/NtpLjQnovE7mh2Jev7aGIfoT9B74oNSuYkKED10YiNYOPvt/hepGGO
         bl5iaC1jFODx82jZyQ7Ulz1meqqc2luZoUefXpG1xLiCL0iiCbh+kKpLrK0sirNvMNWk
         jcLgJMVrjuAtjZdSoZM1+U7W1TqKCnDvoLX0IqaUz8A5EQeiOncir0N4RhRmAlBDnqNd
         5qZq/QzGZG2YnnTfEV8RSavOjnABn7BRhveP8uwjyCjwONOX5JAXOtVnd3Vpm6QncY69
         usaMiI1lAjVRdNIJOCovMeI97XbScCCI7MBrarB3fS321qSEdL/SuMh8IGLmz3X3KsK6
         x42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777875; x=1775382675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=;
        b=Cup+9oeHXxFlKmVJdzrd4JpVy9s2Dz3IxGS1PDKMTE6TGU+7aAXzuGQti0uAZtQSEv
         6TqmfyAcILV8V/ldyqmGZKkAI3fY2twJwFWj4RAFPm1Cp4VYhLaHP+jf3zM9puWNf3Oy
         U2x56g4Pl3Gqd08LYqOrXs29+SHWGm4eFRiWkLBOYrsav/5tUUXRXEAFdK6mGjUAba01
         wE/sSTWn1ZFOIZWRzimv+WBJDJOYbG7ajKNOPEcSNAztj0e50cRwJST768n6JIAJgOWz
         mtiuLAkYz1erGzMxBfeh4FYc1CeAmdROKRdDi0mFK+tdDGV74socV45YxNYHbk5iHFbu
         F5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVC8A23j7EkCUKsMIUWjuQ38nNvAaUwFY637By3MF0TxFcTGw1r9nHgPUspPxOzXhcnc9eVedO+BJG2Ktqt@vger.kernel.org
X-Gm-Message-State: AOJu0YwpmwRah8ELIut0Myiho4hrXrvWErc5SdjPv2Fv7cBtYeO8Udhx
	Jua/0Q724f7KURjrUdkl4wx4JKzqwN9HpKAmzsWmrzCkWeFkpnV10ZDa1hmEBXhAZX9gcntnEa7
	4/CacHAawt2Gfl4VDN0rMQW7rUqIk/xESbGbpeVD+YXC27Qx4JpytvISiPCzvuuuGlpXl
X-Gm-Gg: ATEYQzwCIrPfu1DNo3cWTXg1XgudbwJwH/mpA7+25z2q8Wb06Hp6l2DGCqkIMXHSzMp
	4RdiRdQKT61FQXtdjeyArgmiEIcvuwlFFXsgc610znccYITXJlUsH+BgmxMLFWFyB0YSB0xLTZV
	SnbU4zPxl/ID68HVTg39PhBfQCmwoHwLdQSN9um4n2b0ylT5slf2XLCLZ6bnNx9hbOAdg8ein/e
	jjLKAhFZn61X24uSj4ihSdoVLQMfarjSYGGcdUDCGInyzAYSsa0p3P+fjNdEZNhNNe+A8fTVoRU
	Jzq1fW8I70VMFAbdhB0zmg/rnDDS/mMjHr1WtojnCmHp6qdW7Mvscqw15UJS7Xt9tUYM7mFCbKs
	dEldyWFsJtrhNEltfvOS70edgVy0TgUbqJFGyHKDVCMwCfNOaPy4F80QTfN1pL6LSmgCsn4F8xu
	i74cASKnUABITLUc444P1G0b1/VJiIRqdLdCY=
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr112004571cf.30.1774777875622;
        Sun, 29 Mar 2026 02:51:15 -0700 (PDT)
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr112004271cf.30.1774777875105;
        Sun, 29 Mar 2026 02:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838db4b3sm8282291fa.33.2026.03.29.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:51:12 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:51:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
Message-ID: <44t5nsdwy25ildzk5czpeidjxrelfyz346thwddsi5k5wo4pj7@2or46xbuo5wd>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
 <ocrzwxmr256h3ef7ifwx3z6jgtzubiha3forfi7nao6gakb6wu@recertxxhlip>
 <39a320e472ddc6d44c950a995b577e77@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39a320e472ddc6d44c950a995b577e77@mainlining.org>
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c8f614 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=OuZLqq7tAAAA:8
 a=xFbSPXw9NCUfqnV0eHsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX5/8/RHdA5stM
 HOg6eKRJseK8dzNQmMmBEpUufD98sNXIguKJO6QVlORrUYvKqG1uV+/X8snbxNn6mygRm6ZJJQm
 x7yBHCAXtkER4O/BKjv5/MW7RKgG+3EhNyEviM89TCNpEXnRTCN1Ay/onFXpH7aMy7uZVmk4lKV
 ab+vqt5hZRAVdE8bubHl2IxJzE1BYKyIYEhSY5yWIRJI7i2olLuoDYiRvy52xVabwGzbCiGPjht
 qiOCZbqCz5fVOtr+VEHwu6nkbEHBqqtQYtiqtPibYIumBew/m5k5gzuMNpAxKT78pDeOVhVSBC4
 7jDgmJTi0JZ4ZnhMB7wkKSdR+zOR56r89RfwBHAuXlp8UMG5xFiUMG+GISDjif9u1pkSlUqwt4s
 pOXLlOz8ki7mPyP1hHRyNtn70QVFNJ9QbhWVh31Y2ow36oZuWPXETYMv5ZtR20p9xItP78W3ftu
 aj3AgT/z5XdfqBziM4A==
X-Proofpoint-ORIG-GUID: feIba61OadryUrhtyqlzljJhX8iem2Mk
X-Proofpoint-GUID: feIba61OadryUrhtyqlzljJhX8iem2Mk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290075
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6830935170B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 09:22:19AM +0100, Barnabás Czémán wrote:
> On 2026-03-27 21:26, Dmitry Baryshkov wrote:
> > On Fri, Mar 27, 2026 at 09:11:43PM +0100, Barnabás Czémán wrote:
> > > Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
> > > is using mss-supply as a regulator usually it is pm8953_s1.
> > > Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
> > > as a pm domain.
> > > 
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > >  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
> > >  include/dt-bindings/power/qcom-rpmpd.h               | 20
> > > +++++++++++++-------
> > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > index 8174ceeab572..659936d6a46e 100644
> > > --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > @@ -48,6 +48,7 @@ properties:
> > >            - qcom,sc7280-rpmhpd
> > >            - qcom,sc8180x-rpmhpd
> > >            - qcom,sc8280xp-rpmhpd
> > > +          - qcom,sdm632-rpmpd
> > >            - qcom,sdm660-rpmpd
> > >            - qcom,sdm670-rpmhpd
> > >            - qcom,sdm845-rpmhpd
> > > diff --git a/include/dt-bindings/power/qcom-rpmpd.h
> > > b/include/dt-bindings/power/qcom-rpmpd.h
> > > index 4371ac941f29..2d82434b993c 100644
> > > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > > @@ -84,13 +84,11 @@
> > >  #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
> > > 
> > >  /* MSM8953 Power Domain Indexes */
> > > -#define MSM8953_VDDMD		0
> > > -#define MSM8953_VDDMD_AO	1
> > > -#define MSM8953_VDDCX		2
> > > -#define MSM8953_VDDCX_AO	3
> > > -#define MSM8953_VDDCX_VFL	4
> > > -#define MSM8953_VDDMX		5
> > > -#define MSM8953_VDDMX_AO	6
> > > +#define MSM8953_VDDCX		RPMPD_VDDCX
> > > +#define MSM8953_VDDCX_AO	RPMPD_VDDCX_AO
> > > +#define MSM8953_VDDCX_VFL	RPMPD_VDDCX_VFL
> > > +#define MSM8953_VDDMX		RPMPD_VDDMX
> > > +#define MSM8953_VDDMX_AO	RPMPD_VDDMX_AO
> > 
> > Well, no. This is an ABI break. It will make previous DT to stop from
> > working. You can drop unused indices, but you can not change the values
> > used by the existing domains.
> Do these indices never can be changed?

You can add new indices and you can (with some care) drop existing
incorrecr or unused ones. You can't reassign indices though. The rule of
thumb is that old DTs should continue to work without rebuilding.

> > 
> > > 
> > >  /* MSM8974 Power Domain Indexes */
> > >  #define MSM8974_VDDCX		0
> > > @@ -156,6 +154,14 @@
> > >  #define QCS404_LPIMX		5
> > >  #define QCS404_LPIMX_VFL	6
> > > 
> > > +/* SDM632 Power Domain Indexes */
> > > +#define SDM632_VDDMD		0
> > > +#define SDM632_VDDCX		1
> > > +#define SDM632_VDDCX_AO		2
> > > +#define SDM632_VDDCX_VFL	3
> > > +#define SDM632_VDDMX		4
> > > +#define SDM632_VDDMX_AO		5
> > 
> > Please use RPMHPD_* instead of introducing new entries.
> I do not understand completely, should I use RPHPD bindings in rpmpd driver
> or
> I should use rpmhpd driver for SDM632?

Sorry, I meant RPMPD_*

> > 
> > > +
> > >  /* SDM660 Power Domains */
> > >  #define SDM660_VDDCX		RPMPD_VDDCX
> > >  #define SDM660_VDDCX_AO		RPMPD_VDDCX_AO
> > > 
> > > --
> > > 2.53.0
> > > 

-- 
With best wishes
Dmitry

