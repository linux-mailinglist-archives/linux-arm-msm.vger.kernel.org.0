Return-Path: <linux-arm-msm+bounces-111900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g8tAFKPIJmoQkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5009656CF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YvJgFHCf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WCZbKama;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111900-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111900-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 697DC3031130
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954983BE630;
	Mon,  8 Jun 2026 13:50:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869E3BE17B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:50:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926612; cv=none; b=Lb0/cwE9cuIIpMgV2+tEWdyxhvGn8xIs7iBYSGxg85Ppkig3cQ2qg2FYDPge+TX63eum0RB9XDruEBDW7J8+M2plDTruriJ498MuLcS2RBj4lkhY76C+7vVMr823jd0NyKat0mWYmcNz8gVGCAD2Qp6wk/pdTOkwYu41XoSahQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926612; c=relaxed/simple;
	bh=mAVANFWtLDtgAHnSQBDOOB+4RTESnvMxY8g61AhDU7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7HnDx6eitt3YmS716nD+lZn+yXMAXoeRENpV5qBEkW/i9WlTlsjG4NHGYtV+PUiywIk2rPqGBzI0+RThNk3ihgTyr8/rFaK3KIH+aDdBYVLHJRryjfND0nGNaKV1Qw89yDmYruSGPxBb6XrqrXbd/3z7LBtV0ywTlCeoSc6enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvJgFHCf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCZbKama; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRI8G3346953
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rn4SKsuOStAQRXD00Glk2pD8
	NtpGz2H7OLN0fQ2CGPs=; b=YvJgFHCfHUmbSTsXt1NQmdmu34caGzgLNedm+MEE
	HFinemN9/tnZHwDZISbr9U5CNtl2eeg9ZFMrM1bkohpALSY9KQrNYrRgm3uWgB+x
	w+kapoBckdwGqVRyOXQOWCgKd+70I7wiuDD2dsj067Hq+W3xtuKDuiGmzTgxjWMP
	/m5/vUMFHiV1dTdkf4SDjI6N5wUGxDTREJEoqrDjqpt+qCq2TwuRnAnjvNMcwlOf
	PDTBhtZ2dv2aa53hg9GHP8mFKU8uOARhwjIwaekJyPUiRWczpKZszy/KZuB2YKsC
	JlL4u+0o7RitaX2dLASjBG6hqTZYnX046HkDZUkRuxLbSQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8rt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:50:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6798c46f723so2333732137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926604; x=1781531404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4SKsuOStAQRXD00Glk2pD8NtpGz2H7OLN0fQ2CGPs=;
        b=WCZbKamahomUZJPCi2uVV+Xt2IJtllahfcrmznezg3ADVA8sYH0C56Cg8OBRfxxPGf
         8kUelT0msSuWEf3jyl33aAX7R6B0Uz0RhT9v7OFDMIMJiNGLFL427NdQ2nEUCDEeN3Eg
         Wct5T5MVyieOU7rW0a7/pwPPVYT0YS0cY8cc3QIXvLKe/MYDClYqNgqILw9c9K0qCqPt
         QJE3necrLUCdWeytpyabhkWjDGfpNlRilkN3T+NZ00eKlcxcchDj0vkmlmByEazL/zJd
         i5FHJLAa+GTQuSp7RJ9AvgPkb2ApkCE2GOR41s6Y1jaiC6TX9CVkbkeFewIVWOL5EVpu
         /ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926604; x=1781531404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn4SKsuOStAQRXD00Glk2pD8NtpGz2H7OLN0fQ2CGPs=;
        b=nnFypr95uygXhk0RyNGI6fWQnyBWLQxiFwy9NKNcwaZuIRmCAsyWl40VK1nzQCRF6z
         KWoVXZY7Xonozrf4E4XMu5SGxAgiYY4A2RreERjB01UxPMRm6oak7mhnzBVwZrWNk5tE
         WhaYbWolRw1gNSk1o/X3od9BJp9MZWtEqbjwyJY5Ffmv63vDQ53ClLjrbmaD3yuLioar
         EhmF2MiZbY8Ba5uQ+w6ikwUf1XAlgGJx+Y1yHaqu5opzz9YncoqFn8383pIk28uvjauV
         0j0Xp0lVX+sJyXM0XFjDS25vWVOFL7Vo5GG2yO5omUQ94vEgmq7X+a7iWqbqHw8WS6fx
         zsJA==
X-Forwarded-Encrypted: i=1; AFNElJ98N8OFniGmBMEx5Sco4Mo3NqzWkcrUhFiNEjdEz0JNsO25j/KKMcnkZheptmcAj6R+iji2qOa/eTMx9ejR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/MxFpIas0WL5pWEm7AE0CMsNfRtJtP+GtXDyWmHLLVg6qj88O
	jjhjnfcuaC2Z7tOf8JMnwQaOs+YbdPsnMCpOkhOaC6vQ/KuSpygYZ8sIg7t85AsA6TMYDVidwBh
	atKjGLq+bgFWQ8fm8GBqWZVbznJEq1LQMPpkIEQeDxkv/UwdULAjowpKTe8lRaVmm89fl
X-Gm-Gg: Acq92OEtzoCMBxherfiMKnYCeYkxggBHbOKqiunTE1kxiUjv6g80Ce/ZpA0S1WW7nHg
	h1JEbcAoQHap+dQv9Qptpfh0Tat0xBwIg/11JKIGG9jt4C8sTuaR8q99AU2+lVwxRGfOsEL3N7d
	Ph8B7nl+02oQ5y6oGEoL5OHVI4mGOJXW7Iz34QrsmUp861nfNV/7vsm/UzFm08r4Pukk0Dca6nW
	t/Wwr231gxhKR+iM8MR1GcjC4wWIbq9OsfgcptsibcFs8KQ6S4Xr7hk++soC1XZktb68JkWpu5m
	q1GQaWKbob2oMNea5xDZAS7WEgTL8X+z0eWqsMqsutVMc9YQQLSSOC75X+T616gbqzwspLkxQCu
	ZZssKsfwkDVzMh1DLOvTngXu/iQ67i8axjrOxhUkYwOJ1pdf5niaO/teilK3LLdx0EpRaMl9ga6
	27BCtFgNh+1R5uMSX20mPsqJi2Lxb2npLwQU8VLlQZbx/luw==
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr6807372137.0.1780926602413;
        Mon, 08 Jun 2026 06:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr6807345137.0.1780926601852;
        Mon, 08 Jun 2026 06:50:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm49107501fa.22.2026.06.08.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:50:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:49:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
X-Proofpoint-GUID: EwfSCcpqG3ftW5iCC7pHRvwa5vMQcY7U
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26c88c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8CyBazYyq9SD5gnPOlcA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: EwfSCcpqG3ftW5iCC7pHRvwa5vMQcY7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfX1cOl9fcQE2FJ
 XpzHQ5iR71FceOygZe0q+7sp0djUZSIoQtBHsnaSHa9WK+ZFd4z12w+2XtlLtr41fjwkWI1Kc/x
 vpOKVM2SEJ7o39T7pG5irLK1R2uQvOO54e1w6BoMR/Qf55HyMnjXxDgH67xuWhNPOojL1kh5gE3
 KFa3cIQi9hjK7VZ8rvCzUAYj1IjlxNZ1uViVDyZlh6U9YofyQq8/odN+5nQX4HQWJydILt3qwPZ
 47H+oub4fVeqEpHMDKNSJY8aEyLY5WY8IYqGQjL5NP1ossb/cnJU+5Dj0omI7p0dJJQmDEdOhBD
 THJVmJb4/uUgnQ4ZkcmQhs5vLgsc3GmDwCuWnY7scDUs1uq0S8Zrf7ZXoD3sMQFauMfkYuH33+0
 TRvkqSHZl3JKF5NmGiUl9ShQt6dEvJWGEFobgGZmBP0fH3mlxIqhDCx7ijhr71GySw1+DAAKVps
 EwT2wz9tqaCmYGXsrEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080131
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111900-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,wptxg7exupmr:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5009656CF1

On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> > On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> > > Some SoC implementations require a bandwidth vote on an interconnect
> > > path before the SMMU register space is accessible. Add the optional
> > > 'interconnects' property to the binding to allow platform DT nodes
> > > to describe this path.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -243,6 +243,13 @@ properties:
> > >       minItems: 1
> > >       maxItems: 3
> > > +  interconnects:
> > > +    maxItems: 1
> > > +    description:
> > > +      Interconnect path to the SMMU register space. Required on SoCs
> > > +      where the SMMU registers are only accessible after a bandwidth
> > > +      vote has been placed on the interconnect fabric.
> > > +
> > >     nvidia,memory-controller:
> > >       description: |
> > >         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> > > @@ -602,6 +609,26 @@ allOf:
> > >           clock-names: false
> > >           clocks: false
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          items:
> > > +            - enum:
> > > +                - qcom,qcs615-smmu-500
> > > +                - qcom,qcs8300-smmu-500
> > > +                - qcom,sa8775p-smmu-500
> > > +                - qcom,sc7280-smmu-500
> > 
> > This is a list of targets that happen to be supported by QLI.. but should
> > this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> > 
> > Perhaps
> > 
> > if: properties: compatible: contains: qcom,adreno-smmu
> > 
> > ?
> > 
> 
> As of now platforms where the issues [1] getting reported are added, the
> list will grow.
> <We still have to evaluate and test on other non-QLI platforms hosted in
> upstream [2]>

Do you really need to test, which platforms have an interconnect, or can
you predict it by checking the SoC documentation? I strongly belive, the
latter is the case.

> 
> [1]: https://github.com/qualcomm-linux/kernel/issues/297
> [2]: https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/
> 
> > Konrad
> 

-- 
With best wishes
Dmitry

