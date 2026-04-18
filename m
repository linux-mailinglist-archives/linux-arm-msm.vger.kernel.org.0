Return-Path: <linux-arm-msm+bounces-103593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JovZEtif42kvJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:14:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C04216C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F9BC301CFC0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 15:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2717E2D6409;
	Sat, 18 Apr 2026 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZ6swbil";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9jteH87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4C027F010
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776525257; cv=none; b=KV7J9gM7MYLPVdvKsCiuxJLt8DtFaPWg1/uQSTWqvI2CHj0WssWVkilfFyNxHD21E8+ECKWGLmjNoXkP6RW/9r2C70+PH1gMEQRzbnF8VCe2tS8ccmrLFTCY7MtDm9ljWfICkolcLLVvWYaGKpQyYuz6RkvSvPcQoBi+PifbGXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776525257; c=relaxed/simple;
	bh=204QBBlZ7mJL/vdBS9YjwwPy+5WB5KYa2R+awQTEXag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUKlE4AtTKh9F08SJRwma3rDcfxE+NDdMZ3ogWbkvMQvjCIn1JRlLZUGQgfp/FSHVBWhiYQtGSFhu9kT+PZTPEsPpgEYcM2R3wIeLHifa99JaninCwdEb27HFx5M8/v3z19wO96BhdqZIeezv1Ll2oodHr/IFRAu6/VVb5yrvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZ6swbil; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9jteH87; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4VGJw033991
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGaZcOGTRAX81jTVNqQyBp0w
	ncHbYacT5c9t43/C2w4=; b=GZ6swbiluZmUlFjafY/otNqeKWrIT3koHNOQ6Ex9
	2dFYDhRyVPn7Eq7bX0VIB989lsdMPNd4VpCi5fFhCtoKLB5lZ6eUNByIHnN1rgtq
	jumurd7LMDsY6cHgQDMtQZmVhwq8QC0RH1hnXd9W06ArEJCo+vC2gRR1WhfaVjJo
	lgUDc5dTtX7RCJUOtcZ3eFSuILtJxzU6ORI7beEpCOPsd0L2TWiLFCTOjmL14eBj
	vBs8QLuSoFQQKRgpPcaZzdgZkVTunhVil/D995BwEJ7YClbVEOZeYsb8KvmsuNuR
	p53JB2xr3RXP6X8xQejxZ9CCZ6700NHWYBJD2EsAHMWOjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx12u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:14:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso38751671cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776525253; x=1777130053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGaZcOGTRAX81jTVNqQyBp0wncHbYacT5c9t43/C2w4=;
        b=G9jteH87sO8ZBFCXWGMZfytv7l4lE0a4cxMRqQy9BzKLtXNqR3PmPilQpjPXiqps0I
         26Vaf5hMpI42tJAl7dpfPlW7K5+FQAvDS2Mqa+hBEgO9Uv+K1C9GIz+BxHMYNW3Fdqru
         aqROHfOb8e+SNUBMdXV6dC8ReeBZdi+ZrkI3fjAzJ4cpvIcAah/Lj+oM05dGZW5iak7+
         2ha1GLRswbGfEax7QLFOmN2G2TgOfmIZBmrg8gP5bUcaFfcp9TS30Bd8zuzei29VWRPN
         n4S2FWS6bsjoFZ8JFhGZvqF/ICQgz4woDx8P/gjlekGCzWntZnzWwQszfaNu+vOvnQWk
         ZQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776525253; x=1777130053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGaZcOGTRAX81jTVNqQyBp0wncHbYacT5c9t43/C2w4=;
        b=b3LjRdUhfSxL+PI7jgZ49DqhmeZG47KVuxME9YppIVdeguIQH81LqYeT/+Nzjc2lQp
         4YBoZZha71sDKTS5zozz9hJaXhpOmWuhefbUaDLdCgixTaQOf365CcO5DAxkHRRJs4Nq
         E0g+Hcl8MDYiu8kjknf0OY5BvfyzHnAYg0Lv3BPLBsPrhE6QTiXpw3zsuOB8iA06wthW
         N4VG1OwTZUuVEki9NZQajGOvTMMQRPgJtGaVNms3bxUvAHutgNy3wDNGX/FjHCkgxBkM
         hhUT16Ilb4p38UkC/gf8KdrU2Jrj8u/I1ZKiOV+Z4UgODHaxByYG8CpQJCBflyPjyCSt
         7j5g==
X-Forwarded-Encrypted: i=1; AFNElJ+gp6Drjd046a5s4YoVieesOE6VAWjLTn2HxUPmVXS5uhhqRmfsh3kRAiYxRYg76t/E0I5K63kTtpb2cETA@vger.kernel.org
X-Gm-Message-State: AOJu0YzKqfik7WJ/6ayEY3eNjwkaLUQrOldzV0RhZQ1Ub2W3tAwfKaIN
	E0+qy2EOJdlIA7bpVfkoF+9igrbkGYw6he28m3dAKzQrLY8PWPdmRetHyvd2BC/SLnmrXMJwJFy
	pD1ay1ZArqDA933+tZx2mmztgCxuYLNsK0gWtdLFxU5Kz3fLPiyIcTTW+JVwZ+ASi67Tq
X-Gm-Gg: AeBDieukmyoWQ4GA+DfqZ8gQyE50RtK8Eet0CsSjXHnH6XUryI1gnwbMqXrnJeyDVUx
	Cn7xQfU5ay5IWt3zmRyGZ9b8Ee3iRDZQ3+oBhRgFRsE7GP+hMNVJfwtVZtn8rhvaz0KW7j6oUg7
	xMlAWKkDEY2RtNQAvOWwy2MqoMEfuGtISVDuPoqffOPKJ6vg7UpRrDPVxfKTjOXYkdk/A+Rm2B2
	ptpDo07x6MXbp5FupuOn81MFINj/pTbqXYRug7zi44QunWyBLQ+JNB1pK1APeKv4m5DiFMtAvig
	lIchZ4PdyEp8/f+L0QM52kDcG9H+enBLTnWz2crjrJXmH77SnromvfUjwfPsGmXK5/4K/MDfD+W
	vLe7xSyTDXY8qoaCS4eKosdYxN1ssE9C7TLr9SLdcknNn1Zu5VVInkT2PWsyb5m9xINu1IBlsGv
	yLWEfh3JGkOpIDib5LmsfvJl+wTy7AikKubj12WHiVsOK+WA==
X-Received: by 2002:ac8:5a93:0:b0:509:4406:44e0 with SMTP id d75a77b69052e-50e36b55293mr107133441cf.27.1776525252691;
        Sat, 18 Apr 2026 08:14:12 -0700 (PDT)
X-Received: by 2002:ac8:5a93:0:b0:509:4406:44e0 with SMTP id d75a77b69052e-50e36b55293mr107132831cf.27.1776525252243;
        Sat, 18 Apr 2026 08:14:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm1393177e87.49.2026.04.18.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:14:11 -0700 (PDT)
Date: Sat, 18 Apr 2026 18:14:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <3t2ujr7v24df4o2iplngwlnb242klmr7wkaclfc67ey2taagdt@h4benc7fqesr>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
 <20260418-eliza-imem-v3-3-bfbd499b6e77@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-eliza-imem-v3-3-bfbd499b6e77@pm.me>
X-Proofpoint-ORIG-GUID: C63b6LSA3MI7omnaE1mCBFVg7qkfaG-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1MSBTYWx0ZWRfX3ysulkI0lVIn
 5TYVcPc2MLdp8rYSGm1S78Ny1z7Fta7o97bB1LPRgS04CqARYL1oW+VB447nem4OqKucQkSr8L+
 uWae0ATsVzAxx6h57PGPtJLnsLH1AjSP+yM/VJisk6K+Y1ztKNSgzUARg6HCXTIM3oF/X6BWd9Y
 HHwsS86tmFi6VQPstYD0ovNIllsuc8gajG81apBZARVXDHGXXWdFh+KQwS1ypA1iLZcgOvrOZlm
 8bbAD7rsuuEdUc9CA7MDIBVf8FLAXhU1Iacfirr50F64iUypnT6xh1ROcqOxVTtaaVgZPGD/Ndg
 ISAN49eeSnIoIylGDkGZLKJSLcQd489ChZ1cLX/54R74spGMS4qiWdzmH2m7ZPXxR5855lMlVpx
 wx6cAdO/1Gs/G19zZOic9VtrUYmxmq/9hf4VOETz4aBqIeM9lb0ZbN58AeeJRUrApeXz/Y8leAU
 BeDhCqNYNx6g8KJdW6g==
X-Proofpoint-GUID: C63b6LSA3MI7omnaE1mCBFVg7qkfaG-4
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e39fc5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Dit6OCI-tkvg6Kv7NAsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180151
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103593-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 996C04216C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 10:40:00AM +0000, Alexander Koskovich wrote:
> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

