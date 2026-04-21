Return-Path: <linux-arm-msm+bounces-103963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJR2Kb+J52lY9wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:29:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4FD43C091
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04D273008264
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A883D8131;
	Tue, 21 Apr 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDyBuV1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6iuF/1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668037FF6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781733; cv=none; b=EpQOwmIsh1A72cHTwNlIKT6zafuOrBZ59xDD38Eq163MzrOEquXGRQ9vXJHKgdvRbmjVF3n4tNuBE+gbophztYq1w0eIpUjkWwXcBockebYdepiLfv0z3rFhlcY0FAjJjg8D0pY4I/N6tPuUDasyhKtwk7GYhX1cRDNvrlGOsmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781733; c=relaxed/simple;
	bh=uFc6vK8cMc3GvLEZihdxx3in0TjxH4dzqtGcv8+lVBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/nCitZKsYu9qJ626f/cio/uVTYl5iqOAx24o0nYjr500utSBimNNxnbTTNtY1yMRD+Ft4RXlAX55ucT7m+I+Tis2MedPnpfclK/MkJ+63ysOoLGPPnrRDMIWxdb/0FMoPoQiJUK//2WoaJYH42U6TaqFoob7CKQGfIcxokBTvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDyBuV1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6iuF/1c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LDCeLm1538426
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 14:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sMygVlHzO2UzC35b/tkjIvaj
	Jh5YLbqgv8z23f0T6x8=; b=iDyBuV1WAW3UBhGYGM9Qgfo4F06MOcTNv0hGhTay
	TTJr4uUC1fHYpF92bj9ZijBFinu6GQ6prtDsv+pLQVHs5k4S7bl/U+jrLQJoTUAV
	fbarr3fPhCQ5j7T0cFC+khrGuFkOMJYGPtY4GfPlSFHLjx4KvhHRK3fAjrpp70gq
	rhS/Ema68weXwbFlUyMxUybFTqSzpNqWF6hrZBsmmlXCHXv5ukzdOK4ZolX7jz/0
	wUIVD+3/+1HOFlsANBb4KMoBcSsM4P97mlCir1PG2DXRYAXY49ZAVazhx8bBkrNq
	k8nPrgdHsv7zKwLJDB+jQMzfThbIQLHto8uEH+E4RjjN0Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hahku2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 14:28:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so3971967eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776781731; x=1777386531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMygVlHzO2UzC35b/tkjIvajJh5YLbqgv8z23f0T6x8=;
        b=A6iuF/1cHNrQIpLem1p3bKGdtuKTwbed1Mkn+dOMt1uCg51qjs2E7sDIeSo5QecDbX
         Lx4M5w7GD7jsNyjyi4ui4FQN5uWhOSOfx2RL9zjvR6abJnPBJvZ/2U0pVdKkMTy+uWqV
         NPHEfkx9kfLlVmZUXZ0zkXJ/pAE9RyhsDKuV6ptX4R/MzVnB2KVXjhB+XgxN9S8DUQoR
         cu4PO9YZ44nkwiheu8O1pW8+SqgxoQ+XNELS1/qA4tNCQEIomqzNl6xHBnNI6tXNlFA7
         fuCXVaIXAgg/PWmWXYLRPS0mp5BZrNc7EIqkNfAmpzUF5hZnn9EyAFNwjdp/7cMTLqmN
         savA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781731; x=1777386531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMygVlHzO2UzC35b/tkjIvajJh5YLbqgv8z23f0T6x8=;
        b=Ebk41nsi3stVuxfjBAgG4dK53i/Q71ohmxePnOgMGX5Z457tMBZzeA2Q9jTfhHyxkd
         ZYIwOt1YzBKJt+Xbx27YQF1KGjUX9f8roWVKp8rIKczMweAv6JNqJTXDWox3hwbTgq1T
         ZHpRYNuu2XrSrRq8tYIifWZjRy1tQkYpMFwilX3mb9Cv8g9d1QojUK4Sl6Fw06oM9Coq
         QSqR56/It+fXDXd5ar4sxB923x+3+aZpeUfiHlIdpifyIO06aI1IHpp/tp0dbs4T9Jz1
         AVpB8llQ6BCrR8Nd6SnS20M3TudgZuUl/pEQDM9J3HFABCaNrcdR1iZ9ifnlczu311RU
         VUCw==
X-Forwarded-Encrypted: i=1; AFNElJ96YakIwP9Iu2yqIc1/nSRj35R7a6CjgFbmRjqYZ8kpHrWHXf7MSJ0a1xIDATIOW1EYRowX0HOxcJ6j+BTr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+XNmXW+nVXCNT2P5ODHF2a/zw3TZbPem0bzRuDAn0cnNwxXG+
	0R5Ds858IjPNZ3tJX7VabkYOyAUH6ewHQ8JwSYXC4i8aYHtD2Lx6LmVsV8yp68Cx9efv+SYdtQl
	vAc5/mJDu6k1DvkwVFjRmyqCbwjH6jl7HgQi2OMgVQoxfn2RClwlw7F6hmV2m7AhH/6zI
X-Gm-Gg: AeBDieu4c36mPpD2Hwy/S1WhIgOknp9ToKCg7owm8HQnkoprS08VzqxoEywfJKtCHpN
	ZTcUMlViylyKkLAQbU0VS3fQYYfcRyoXWIJrSvWAVOqsavIHOKOIaq8nlIoO5rVMn1mjOwcwByN
	5c3i0BvzxUzmbT/qRlzuW5KjuJaQE1rWDwMUsgQhPsgs/y63OG9tKoJl7ZWexehxBgcmKp1ul1s
	0G9vDoIU+RKDWXW17MWDYG6S1nYoqp5D0ue2kPdLN+iJHgAHH8fWhxQhDrU4biuShd8S9nMCkte
	wn9rGq2FKyToS76kASNyNETHYzMQFRnpDWYQRVwCorgyn1AwbnzdMLddssYlbWby//OHMjMMAJT
	Ng6Y0BbG0oKAVrjkHenwRH1Y7PtPipDhRmAkh6BDQrN0AnBztTsgea4+ZuAw+omMuccNqq+38Ux
	4=
X-Received: by 2002:a05:7300:214e:b0:2d8:4705:aa19 with SMTP id 5a478bee46e88-2e42c848ef3mr6597316eec.5.1776781730435;
        Tue, 21 Apr 2026 07:28:50 -0700 (PDT)
X-Received: by 2002:a05:7300:214e:b0:2d8:4705:aa19 with SMTP id 5a478bee46e88-2e42c848ef3mr6597295eec.5.1776781729570;
        Tue, 21 Apr 2026 07:28:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d9b056fsm25298900eec.29.2026.04.21.07.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:28:49 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:28:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] scsi: ufs: dt-bindings: Add compatible for SA8797P
 UFS Host Controller
Message-ID: <aeeJmk3mGn7-SSYS@QCOM-aGQu4IUr3Y>
References: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
 <20260420100416.1252983-3-shengchao.guo@oss.qualcomm.com>
 <20260421-tiger-of-pastoral-potency-d4502e@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-tiger-of-pastoral-potency-d4502e@quoll>
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e789a3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=I3NryFtDZQfIPkP-tIcA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: zeYuOlIqyRmLeZ7TstW-dT7EC6d1x0hL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE0NCBTYWx0ZWRfX/t/ZBYAVfUsT
 KwIziMDh1jxV+2qJQBlzUh2RAYNcERhKTYvOuj7UFYNUa6vSyL/EeX0amgRT66NloOSbsj+gNZx
 ZOCX1rZtFSrtsAbcEiQWJgWVrnT0lLb+WnBVcP/fI5IwK7StbFOEfohLxzXEiEuBg7YSpNMK8WN
 JDUbJEQeVwE0t41HNaFTNvRG3loDTubQFvuqnaseXptDN3ZkBEfH4SZWNBYGlsW0WCJUw0rICz5
 XWlGEel1jp5iqaip8cDJxXZRJ5T75u5ZvUn6WGz8ReYr5OwP2T1UOMPbDrL2eYZbPTtaDGePo2a
 vtkMYOtXLWD81+Fz8uh88crt7u/W1zqdIgQtIgrFTpfn0q/w/weo6v/g9FVG9zQ7hC/ZneoNva5
 cAworv9AeRKtux06k6/lMu6Pkjvhj1DSb8FcI8vsAgJ1OW4LhAFIitmhq4rxcL8RxNX58c5Z8l8
 KtB77PsaxAS7XgyeUiA==
X-Proofpoint-ORIG-GUID: zeYuOlIqyRmLeZ7TstW-dT7EC6d1x0hL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210144
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103963-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C4FD43C091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 12:37:31PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 20, 2026 at 06:04:16PM +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > SA8797P is the automotive variant of the Nord SoC.  Like SA8255P, its
> > platform firmware implements an SCMI server that manages UFS resources
> > such as the PHY, clocks, regulators and resets via the SCMI power
> > protocol. As a result, the OS-visible DT only describes the controller's
> > MMIO, interrupt, IOMMU and power-domain interfaces, making SA8255P the
> > appropriate fallback compatible.
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml        | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> > index 75fae9f1eba7..f2f3bfc73216 100644
> > --- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> > @@ -11,8 +11,11 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: qcom,sa8255p-ufshc
> > -
> 
> Do not remove the blank line separating from the next property.

You are right!  I dropped the newline accidentally.

Shawn

