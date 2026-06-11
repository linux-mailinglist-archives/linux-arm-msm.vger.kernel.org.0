Return-Path: <linux-arm-msm+bounces-112631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S/AsFdVkKmq1ogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:33:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B566F679
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:33:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z88Bkpq/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dYuDsa5G;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112631-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112631-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9674F301C92B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6251DC1AB;
	Thu, 11 Jun 2026 07:33:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D002D7DC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163219; cv=none; b=KWzI1Z/+GZfZqrWAl8imRZyVDFFrCtDb4polB6yD3kafXxsbz1cUbRsCqWGVSYilte4PkJToKxEDjddLKBbGHL3YRqXkfQ7lvObEEAUfhYKp6/24lyVZ2t2VcYXZn2EpqUU60tW5OB3QBddbva8w0+GGZEWoWg67tI3Ou5r+0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163219; c=relaxed/simple;
	bh=ytJ8okN9JZxhF2ZoWk2+dYco7yFbv9lKhYny7lwghfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbImHvjvyO1hmKow/uZ9lA8NcvP77COoxSPCkpiIiLO9BlinloDcI8skWviXDe12FXIACT31o0EcppGA9BawqbLi78a+Qmofz4N5FOAFSRSpkAqW5BvNDKRcRApMTD0ECgiMXNNnNhOWspp7pMZN52DFbEzC+KfKCEkE5TqyX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z88Bkpq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYuDsa5G; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GRVU3863692
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bjQBXMPnPtzF79EEhbTDIMAu
	fO8c3wP93r4e7L4L1QI=; b=Z88Bkpq/6lM8XhX5YxqNcd9iQ5ugs+gg1p3WuBfk
	1Y6svimypLXduCuCFKer5mCUIKY1DfZb3J3Rvy91F3pk+9Jm+aQOMykmpykyxS6b
	EG0Kyj9S9q/CrLBKpefcnbtqNm5m4tHEBr6DJSl5JfnVjtS870tNTDsxUMZutWXp
	DLaCUGdJobeT3EuxZgiT0EBy2x/iJk7iF1I346IsWtKWYaq9WjE1I9ji8z5nylct
	ZNKGX1PrzaBE0rZLJYpWKlwWlcxjF787hZ5LZNE6oisH4Cgdwrk52wFbu4XtgAaN
	l8XklSn7tppimYXD1InoepGR1+m6XpErISRDiHMSD4zv+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sj96y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:33:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d99629fd6so12346263a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781163216; x=1781768016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjQBXMPnPtzF79EEhbTDIMAufO8c3wP93r4e7L4L1QI=;
        b=dYuDsa5Gn3pfXcZtP+Zlf+whhOHaZn846lF8BhlMc+DCUX52iKhdevOlCce/22ifj1
         xFYMqHjXIfIGJgC7W0/BF1JXadSOePDpUtiQXoQfbQVBTDRK9UZl4rbESCBIAFJbk0Pp
         SfKMmhmSkwORkaFEzRQ9Wvz0+ELoMlaRYM3TY2vKxMn1aUSpjakEvXvXsnGpYecOnJ5u
         6QDpm8ngVgf0V5sEBGelmTKdwcwC8xh4RwaMZiUwiOgvgypSt+MI1EqIbDbwKxZS4BPE
         B8XPqpbDNwKFMMGFLTe1Ve+vue11Y994SGk01eIrPZcB1LFFusbn6QMvdhNI3i5owQHT
         iGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163216; x=1781768016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjQBXMPnPtzF79EEhbTDIMAufO8c3wP93r4e7L4L1QI=;
        b=VjIdLNFN7r6CjiQj25+u8ACiZoGdRO/97cfNkWPjI1/noeFMPGeQ9V4BC9Ddor2Kc2
         Y+kT57Ie+peJPdIroNRQziV3eyqkKvOOku5aUQf1pSSzaGPDsNpHsL3BzS4j/3Q+Qxee
         wkbuYCgekNm4JQkjEBA53iucBztLZvZHLwcI5LIV+nBIW+RtNr+YfSWxMyxfDQlglA1w
         ENStSyJgs2LNYYPayGcJefDcRuKloB0dQ7Se1HPACEc+/rbNM6F8Z3a9Qyw2vTlqnda2
         I6h7Xq1XHsYhrb47jBVSo4O9j6DUzN0ld/2DlLDgCJkoyx7NveXJC8IeTfVeSQIkzAt1
         kRLw==
X-Forwarded-Encrypted: i=1; AFNElJ9z++IXom+oaNKSnOvmjrb0FxkWCITZwJ9wOFyl5kBV+Egd92+4m22kcU0LndqkQrP4OFgQ1JCpQvDEu27y@vger.kernel.org
X-Gm-Message-State: AOJu0YzO9cOVit+Fg6K20b31kykVLy0pHDQJqKPbT6ciXzzhYKeAray8
	/nyQ3tT0TuvRCZ5KP2LNLF50pZ31wYW96F53GF1r+fIPCbIhbbbZlOK+jr/ykMS+Z3xiE4WMVCB
	gJgvZybwzexz3YpDTMTJqT4AEn1B5G9GYjrBQbmFjYdT+QXe53AkKEmVT2EMV/c8RuQLx
X-Gm-Gg: Acq92OFkoxRzj5QdTKtKhcPfadLM9pz6qEodqol9kRmMMp4SKTJcnTujR+/LYFg6TL/
	ozc45lEBwPVdGqg9mj5VA49rfPp+X/0FR25GdIRxe3Nv4ao79/1hoTt89fzZtKhOoC60nhYasY2
	qqt7mQSYsd6v9h6Ep4gxweXbpFuUegXGLIlro4RVXtScSaZ1V3N/w0fQOoR/MTt1fGaqxJA2AOo
	90wTQ7rzcb+NcIzHpqx0k+AjrLesQWGd6tocs5XI3E7hE4J4iSlZk6i/u5lefHsgHx7zzNTByFd
	kc0UmqLiGHgrg1Jl1a3tF5D5isDEFYX46TDJftE3fbIrBP153Zi0D/yPrlQfQC3XxHMyIOklvNX
	upStw5W0zULy86ILgUR7PtNCj22bFP1jgYzDn+J+WZ7J0AZZSWSYJiTxq7Ug=
X-Received: by 2002:a17:90b:53c6:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-377a89e79f2mr1915918a91.19.1781163215482;
        Thu, 11 Jun 2026 00:33:35 -0700 (PDT)
X-Received: by 2002:a17:90b:53c6:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-377a89e79f2mr1915886a91.19.1781163214954;
        Thu, 11 Jun 2026 00:33:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377a9194afesm1045394a91.2.2026.06.11.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:33:34 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:03:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <20260611073325.a6whpruvvbvnz6t3@hu-mojha-hyd.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
 <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
 <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
 <88c161d6-caa3-4fff-afaf-d10cacfe9929@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c161d6-caa3-4fff-afaf-d10cacfe9929@oss.qualcomm.com>
X-Proofpoint-GUID: RL7APe98wVWixqJmRGm7D9n8EfPGe-kd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3MyBTYWx0ZWRfX96OHNRe7JO0o
 URM1BTW4zuxpRS5dLNMmUeb52Af9l3pzRVWlSgc+tNf0MLFaFwNITpRS+dhlac5W00dpPQETVW7
 AB9X1a659bXt5Da7eWZyA8I8hDz2izM=
X-Proofpoint-ORIG-GUID: RL7APe98wVWixqJmRGm7D9n8EfPGe-kd
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a64d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Uol-AZYEXUal4WlXqusA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3MyBTYWx0ZWRfXx8SjSfvoB42G
 Pfmno2MP5L1ATgZnAJ9pSNKmlnWtr3BDAuJiWWTZsz2Swb3EW9waZPqviGBRvkVL0SfUQHOW45r
 sQDj7hJQOAdk02RwaMvgrOdhXd6UaXOlS/pmlr3QEf58Rjhqr9eT43Nh0ggHbChbflenOOVTUcz
 Y8PzdUGL62a047LhmO4u6nAjfiIIJIHlxE/0SJRq1PIr0ci395JHe4kb7s+6/XPaoNwFpjWQfLN
 SxANm/uPQFds8qgNxlkTJg2oZtUweZPi57rp+slfknC1e0Z0TAh+0J7thn28u0h6CN4zxPoNrvE
 r0NVI8aFSuxL6reJZMIFzq0HP+leUeJ01gJG4BWhO54xZMbYP3BCwjJOEZZ6HbZvZvKzk1MAvnh
 7lgNlcO+1+1X8nyL3GWmjd5QaU2iE2xeH39iPP5fNBsRPTlWoI52U3alUqFI/n6rMcdVHYZvNkq
 JL0NsRpioG6FvE3uhsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112631-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:konradybcio@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B94B566F679

On Wed, Jun 10, 2026 at 11:11:59AM +0800, Jingyi Wang wrote:
> 
> 
> On 5/21/2026 7:22 PM, Mukesh Ojha wrote:
> > On Thu, May 21, 2026 at 11:42:49AM +0800, Jingyi Wang wrote:
> > > 
> > > 
> > > On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
> > > > On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> > > > > Subsystems can be brought out of reset by entities such as bootloaders.
> > > > > As the irq enablement could be later than subsystem bring up, the state
> > > > > of subsystem should be checked by reading SMP2P bits.
> > > > > 
> > > > > A new qcom_pas_attach() function is introduced. if a crash state is
> > > > > detected for the subsystem, rproc_report_crash() is called. If the ready
> > > > > state is detected, it will be marked as "attached", otherwise it could
> > > > > be the early boot feature is not supported by other entities. In this
> > > > > case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> > > > > can load the firmware and start the remoteproc.
> > > > > 
> > > > > Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > > > > Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > > > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
> > > > >    1 file changed, 58 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > index da27d1d3c9da..ac2a00aacd2e 100644
> > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > @@ -60,6 +60,7 @@ struct qcom_pas_data {
> > > > >    	int region_assign_count;
> > > > >    	bool region_assign_shared;
> > > > >    	int region_assign_vmid;
> > > > > +	bool early_boot;
> > > > >    };
> > > > >    struct qcom_pas {
> > > > > @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
> > > > >    	return qcom_q6v5_panic(&pas->q6v5);
> > > > >    }
> > > > > +static int qcom_pas_attach(struct rproc *rproc)
> > > > > +{
> > > > > +	int ret;
> > > > > +	struct qcom_pas *pas = rproc->priv;
> > > > > +	bool ready_state;
> > > > > +	bool crash_state;
> > > > > +
> > > > > +	pas->q6v5.handover_issued = true;
> > > > > +	enable_irq(pas->q6v5.handover_irq);
> > > > > +
> > > > > +	pas->q6v5.running = true;
> > > > > +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> > > > > +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> > > > > +
> > > > > +	if (ret)
> > > > > +		goto disable_running;
> > > > > +
> > > > > +	if (crash_state) {
> > > > > +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > > > > +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> > > > 
> > > > I am not sure if this is already discussed, but what if it is the first
> > > > crash with recovery and coredump enabled? What would be in the dump,
> > > > nothing? As there is no segment, is it expected since Linux did not load
> > > > this?
> > > > 
> > > > This is even true if it is a crash after a successful attach.
> > > > 
> > > 
> > > It is suggested by Bjorn:
> > > https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/
> > > 
> > > I did a hack to test the recovery by setting crash_state true, it can recovery
> > > (stop and start) successfully with below patches:
> > > https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
> > > 
> > > For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
> > > rproc_coredump as segments are not configured in attach.
> > 
> > 
> > I was not against any of the stuff, but mostly checking, if we agreed on not collecting dump
> > for first crash when soccp minidump is not initialized which falls back to full dump of the soccp.
> > I see soccp minidump id in the downstream but we have not added in 6/6.
> > 
> 
> Hi Mukesh,
> 
> I prefer to add base rproc attach feature only in this patch and skipping the coredump in attach
> workflow.

Should be fine..

> 
> Thanks,
> Jingyi
> 
> > > 
> > > Thanks,
> > > Jingyi
> > > 
> > > 
> > > > @Sibi, has this series been tested on Glymur with KVM?
> > > > I don't see the iommu property in the below patch.
> > > > https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
> > > > 
> > > 
> > 
> 

-- 
-Mukesh Ojha

