Return-Path: <linux-arm-msm+bounces-101585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDO6Jl7xzmlmsAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:44:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159638EDD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FD453027B4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 22:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2423D524A;
	Thu,  2 Apr 2026 22:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZqA4XKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/UEqsj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DA5372B21
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 22:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169867; cv=none; b=GcVt2kLZtlGN7Fw6ScVcYLxXqn+K3RCMlh5X0vkOgq/6m89EXRPdQ386gR3/Q75f4EIYi3cgWp7uH+KNjnBul9juVh0WCSKLBRGz6oPZ0uy5r70me4Zf2TwG1kRjXZpkbzFxSZ+HCrDoVxFfNZm3BYozQ2Z3MIhMgASHzHBTwHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169867; c=relaxed/simple;
	bh=z2S0O+Z6SKjDTzHmNBzLfCiFcj/fjoPQu0kmvFQE9mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvvKTWX8CGP6b5fs54gTjoj0dNv4GiQ/at7KY3u6Vs/1+3I+UXH8JFiqOixsDaT1pL2iGD0wkzLmEckmAUwGtIilHJACa2w+vtSOwDhRsrNUufQM2KCQMu/j5o8owQzHv/LP1kq6CqonESqS5WTBFuD+Twjec5quWbDr8KRRT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZqA4XKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/UEqsj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4g3E1525648
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 22:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UFKNSmLGChWbcHC+BOvNrJhyweshXNps/7M9u5hOUM=; b=CZqA4XKt5yhWCJ4J
	psylQCzfLI6KnBTytFRESmxSBv5qf3fyao5e1/MBTsTIujIbrhhFd5d1jyHCEQOf
	SBLJJjTu5haDqu0nWpqDO/FEiGJ3n6FnjGIv8TJE0CndxXGAmlTY5kt493jfcae5
	fKZb2rC+i3vgHQbggTM1hCAq6cC3rddGnd44LUMjFN8wgZNXVPh/rolI1qSSVZOb
	2bgIfCDqc3UL7DYIotLw9MZQQO1T+7g8lxVcvklMSfT6UVhVtGFUBlZKUni+cH7W
	1t9Ii5gsiqpKCM9r8m6IGIT/qKpNYol2NKT6Zozty9xTASY2Tp9hR4FBaSiaFZKB
	ctYIKA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcubrny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 22:44:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1784689eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775169859; x=1775774659; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6UFKNSmLGChWbcHC+BOvNrJhyweshXNps/7M9u5hOUM=;
        b=H/UEqsj/Q3CTMJtmlEdZ83svffwVo1C6IRvu2i7RNsDq94BbabBOsKwcATZV6Pm/AG
         rWjOCJp/qHW21/BOEZVpCX3nmzg+DzLRmOz77j1LqR5gNvYaPJv5zLqFdFXDcBs7oC/T
         VQRQqqQK2nnWWRsnGvLocTBH07haxuHV22pnhx2jueFhfiOjOGpypurhxSpeSJZQAgno
         XyIbwNCmYtvz/JmCw13xtRL9Tx0NGo5PbA2NVYhlglTzg7UmsYsaZPFJIHw+KPCtvfzM
         VwXCScoK1z0xMG5Ejw7FjBWy8lMFZ4PmmDOiVynMAp9LTXRbPkB0sEt6XDyfLqktfBsH
         T/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775169859; x=1775774659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UFKNSmLGChWbcHC+BOvNrJhyweshXNps/7M9u5hOUM=;
        b=a86vaDPGESfb7jQPVXgu19CiBCbr7dS8KFh71YGpK0dLb91HLvfFaAWuuHgSNnXkG8
         Q5liJW9vC0BtE7oxPkv2fRALneBCKKWGNR3XxIFwSTjYQO/cDps6cVR0Z9q8dXSqp/YC
         E+7izg9BcHXuCkKTNeTDgd+uzVlsQhzd15SzFn2ZL40ELvRnapIxL1rq6839ta7d+14N
         UOwU3ToH8QyYsP3QCZVZ3tPVr6HUp/2IjofP6WhUMtKRjUPv79g4GCq8hJ/6fjxAhj7m
         Dv5J2z3qe4vwaKjXJKrxSzRWLL5qcH1aSBp4IMUIc6H8BiwE/HrDPS6iFMkoba0AL7KC
         bRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWZ3Er7jGI51besEgjhiDKC62fN0bEQnFeYYTA/nuID4V9Hu//XUMqnsViKtdq9g17J9pGjNUpucODBJfq@vger.kernel.org
X-Gm-Message-State: AOJu0YwN+m0Cf9rySbugkXnFQ5VpUi5OyE7AUsjVN60vhvBPz9ArNeUb
	3BjE5nxWzKA1NqwuyvEQg52BiFZePn41yKNEAX83gVev3NMkk4aajbyJXM7xZNafJKLaz3CDV/+
	pW4PaUmyyQpXEyouSj8R0IJ21FE9iE262F+NwfJVbTOsdI1hWd9ChTn52gfgZt4XMkaQ3/Weu3q
	w=
X-Gm-Gg: AeBDievRNu/l/6rvsEngn96YZ070VPN2mpBQhjWSewaWZwwocRBop6+51aUYeiyAc8Q
	VZ0W3NIfv/WR8Hmdniv60ZNZZkts0TivskdUHoqFfq8OmOISXrxCbL5Gs0+8Rsv3Nkej0EPNOYd
	5u/gbYKu7jlYdzQoaJjTUKi0J8YSCAJ2V0JLG6Ls28WSxMFBirUYh4UwWuGXB1hcu1oaEYK9UWJ
	s6eSbK8Xl5FoiLSEg6tSTHyIqSDU6t08Us1frc/BBA9stJo1ne+0I8gl7D6IsaNLJ/iGLqdeyQe
	yxI+WypQeWRCfgNQ7KyPER3XA7rVHhu8/F9gwhWq9ItrUVJuug48io/xOEUGgFdtxTS3msWOR4n
	gEq0Q5cFNV1yOynws20RtvK0dzjsEsRjgvpCOmNi3GVyG96WE3sVb3FDtNqOTKZHPLJL4QQoxkg
	==
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr507953eec.3.1775169859342;
        Thu, 02 Apr 2026 15:44:19 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr507940eec.3.1775169858727;
        Thu, 02 Apr 2026 15:44:18 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cba62d7590sm1943062eec.24.2026.04.02.15.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 15:44:18 -0700 (PDT)
Date: Thu, 2 Apr 2026 15:44:16 -0700
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Document Hawi and
 future SoCs
Message-ID: <20260402224416.uia466lzbgef77oz@hu-fruiz-lv.qualcomm.com>
References: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
 <20260401-external_llcc_changes2set-v1-1-97645ede9f6a@oss.qualcomm.com>
 <20260402-dynamic-axolotl-of-tempest-eeeb7c@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402-dynamic-axolotl-of-tempest-eeeb7c@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDIwMiBTYWx0ZWRfX6XtKf9kf9NkK
 I5edSfCcJoRGu72/7bPuoHTD7O1c+CcaX7sGVRnfZaDBwW5NC7CxavZ+4gz8z/7mAb6xlt0Pfqg
 /o57Dlqiz39W6HeoMGfrLqf/uBBqu4NH7ylN+7jKmC6j31S5Fu1iV7lDQWhZA8OS+O6dQ0r4ba6
 givJD/57RoywcLUN0Q4yFcYSrDaouJSyDJU6rCP/IeBIsdAbENb+gfo/NG7zc6tXkNCsZmxFeoG
 GtXPJg/XfTQ9XreKd3QtyfeAu45RvnYT/LE0bzTLn9pDIGJO21YHXHbOODjdtS994klNy7GrS0t
 WP1nunmFphMot3JWICQdJJ99cPUievIUXS83Q0gjmA/wZhScdHK5321QcXYNN1u0oqmb0svgS9e
 gZBvvPPhabhzXo/nDjtJ76gJyjHsjS/y/zS32VdSJfsZ+B34qkb829jR1AOfkvMt+z6bZByhF7u
 XJCEy+fkPXpP6uFmWCQ==
X-Proofpoint-GUID: udE_ZTrEgemk1tfPMvluf640JQyXoi6p
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69cef144 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WGe_n8jcfaY_jPX_giEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: udE_ZTrEgemk1tfPMvluf640JQyXoi6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020202
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101585-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-fruiz-lv.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0159638EDD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 11:19:42AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 01, 2026 at 08:01:34PM -0700, Francisco Munoz Ruiz wrote:
> > Add documentation for the Last Level Cache Controller (LLCC) bindings to
> > support Hawi and upcoming Qualcomm SoCs where the System Cache Table (SCT)
> > is programmed by firmware outside of Linux.
> > 
> > Introduce a property that specifies the base address of the shared memory
> > region from which the driver should read SCT descriptors provided by
> > firmware.
> 
> Subject - I do not see any future SoCs in the binding. Which future SoCs
> are you documenting here?
> 
You're right.
The "future SoCs" wording is not justified by what is currently
documented. I'll drop that wording.
> > 
> > Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/cache/qcom,llcc.yaml       | 29 ++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > index 995d57815781..ca1313de10ca 100644
> > --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > @@ -11,16 +11,17 @@ maintainers:
> >  
> >  description: |
> >    LLCC (Last Level Cache Controller) provides last level of cache memory in SoC,
> > -  that can be shared by multiple clients. Clients here are different cores in the
> > -  SoC, the idea is to minimize the local caches at the clients and migrate to
> > -  common pool of memory. Cache memory is divided into partitions called slices
> > -  which are assigned to clients. Clients can query the slice details, activate
> > -  and deactivate them.
> > +  that can be shared by multiple clients. Clients here are different cores in
> > +  the SoC. The idea is to minimize the local caches at the clients and migrate
> > +  to a common pool of memory. Cache memory is divided into partitions called
> > +  slices which are assigned to clients. Clients can query the slice details,
> > +  activate and deactivate them.
> 
> I don't get why you are changing this. I read it and still cannot find
> the difference.
> 
> Introducing irrelevant changes only obfuscates the work you are doing
> here.
> 
> Best regards,
> Krzysztof
> 
Agreed — The description change is unnecessary.
I'll fix both in a V2 of the series once more feedback is collected.

Thank you,
Francisco.


