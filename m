Return-Path: <linux-arm-msm+bounces-105366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BSxMqdV82mLzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:14:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8134A33F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C44693034084
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D5C41B355;
	Thu, 30 Apr 2026 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wv4+57bH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwcyrArf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0741C2F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554810; cv=pass; b=YVoQtmAs3JGD85jbrZjxInfQMMw2Pb/mKoDrvT1Bk1w1y96k95dBFtEZCXmaLvxC9HL8LpRSnn29GlocYR5gOVypWjRo6ooN2VD6MHUoRX9AuHTcI4LdsUIQkNjuv71+L6vgspaGT3gp0bw4CNm7u5/jMKSVIWagW8jXwO34C6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554810; c=relaxed/simple;
	bh=uOBwc+Vl17MdUv77w9tKQsD4/qPdD6T614WQexS4A50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ny5mZHmrFv09t7UlGQVdIDz0m8my2SQrLvCe3SzKZdMMaJNPONM6H4DlvlZ7COjF8AyNsB32awv/2CLL/mL/Q/6jbqfk46MUtMmcqm5C5iVHDZBSNTedWJjeEpsx5PLVZIH7T2G/nOOKP8/sPtOkuWgLlZNeEmLetJ6k1PYzCQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wv4+57bH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwcyrArf; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UArC7f2907552
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=; b=Wv4+57bHKS59t2pn
	l788D+Bh3SNVywmZLGOHfFpV5gix7UmN+Hbdo/rkaV907faoB34D6MoaRtws6I/F
	v30P+s1u0dEaN27jtCCPCVVP+r7L4EEy0FvbN7cRN35CSHU9XxqTb32ZATl5T86t
	UrmjKIcb1J8hNdRzni/k+tZLpRqGXhoJRr92bkpFOWRdgTmqxOYvkyjH1cO6GXnx
	iRe4KV/oP4i6FXY0oe260zuknkGUSwIURJlJbrNK3gxPYKc7iPfxfqQqhZFkUzNG
	0yB8b1v+rCFij5Gpwopcwf+oxHOaJvlbverrXg4+0dPQ0rN+GBwkFpQ3zascOloc
	t7rLFA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfa52t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:13:27 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64eb0bbab48so1910930d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777554807; cv=none;
        d=google.com; s=arc-20240605;
        b=fIRNZGVAbs2tUAPKLLF3C/FYpOE7S/itRnRM/E/h14QUfKp4d20kYZ6sU+q7kRVNG0
         8Qy50OLl0KwxN290xe4rQq2yIqzegFWXFl9PGeZRpj/8TGRUHhIRFPAySfPtwG/a/y47
         4CxdWhNPQBUSi2k7mgqC7xKAwGPifsKD3ObAviuz4GGVfUKGmHbfwfqRHux9mbfzDuN5
         RpZGxQNB00NrsOYQtRdNbJpefYIjqyBgv8Txp1zb62clGltLfkqk8TmHcLUZS9UDKOVU
         72vtc9121wqjjNJaz5JAg/Tm0GpxSthEp2JE5wLsnSE5+2Z+ETe0UltSbWOC5F8A2bI6
         KJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        fh=ELVNexRpIVaMiq+JdBoHxS7ZHKbKAfCr2ZJQkDqeMj8=;
        b=NQCoJQoHXBpAiTN51/e9eoCquUzyrRq1mhb9OSCAKm4a/NujL2qKAIFhKPoyrI6+Lb
         yIyhHQVqHT8V4IhCH3EUvGWhtpfWKS/5an8qG5bXiNqHUhjXZEaZ8uJ/f6F3u2LT/0yU
         zx4GaYbFCl4EBzdzlNgoSjAVn6U8VxQvIun0iKVLVazMc1MfLCsY6MRlppUFlin2Rbme
         UhrmbAu+IUiyB+UEpszb1oYwnOss1TPq0YNpQq42YJAvsYr4sgnOW9ZIIQ5qe7USIh1B
         z7EO6T9k8bqFk1eOOtDzSBbLMIamIgKSEUqk0T7VRf6pXaH5k2vI2GGu3YanFZTOH8fh
         zMnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777554807; x=1778159607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        b=FwcyrArfxVUEmUhB3u8Cd1zaLyprWFV/8QsAGr64S3i1OKV1YWT5ge6d65LkrBgQtj
         i7VvtXz4aCnaUNAKiQA9yIRIXzjfEDIZTvDcxoq+VaoSJx7Z0sngsyGGBstj8Zvk3Feh
         kPWTRxJ3uWdlF7uGPCQIIJ9C1SFAWMCMuvsid+MwkkbpU6eefPGaUbvLCRJjnsjgxu0x
         3lLI9mQiZy3HPWt8t6c/kcOEehIRou+EqkUsyxNXO1QEQ+p+8pLFv4Pyjak72Qz8q/d0
         VkOwBvmM06nD8NE6SpVnDntC1KIyiiFErPPHhQmuZfcxGiVvQiTSqraGm/aAFjVkqurK
         oXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554807; x=1778159607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TouSduUFbw2zfEHACuqETKI0j08FgYQyPnYjBVsGXhs=;
        b=A5QOrFaKRNHOPgh+3Aycv4M3qEEmPACJQdA9A3OWVoziM0lWGirDr+8o6ShvkqQgIe
         CV3rrWbAHrp72GABbkPFAclxXeNpeqRQYX2pGlPZJ1pi45QpTNOJel1RC404MflNDzEO
         s5aOa7ssRSr8xwm80tXbKNXFHmkqR78zsHLx9hhaUSFOoFG+BioqB7Z8tuTBCUZ1EI4W
         EAR3cugQbZPhfOCq/1uIZCnh5TPSwu5zLMUSuE7fo0TblsISjdiUPrmaT6AMgSg3CvGr
         jRs7iKZ7XQkkQborUKlfz3xtF4PcLWn0gubvC172wGkgMsPgwS9krOJ0tMJvhapBZWI7
         THQg==
X-Forwarded-Encrypted: i=1; AFNElJ99IBCHSjU+TM2jEttZaZyJKO/lPpN+D1q8HzsqXhQg1430Gl946vIobGxOwYHMVlCMeHb14IdMnsJnAvMt@vger.kernel.org
X-Gm-Message-State: AOJu0YxHPbZZ7988wDkd7JepGWxpwWVZehtdplEHPyE+covlJ7/AzFfd
	rsknU0CSAakd5RDFG/eOSrQeg5Evz2wkbRjfmf9zcdB0sbf0OPHZqWv6xxp6VyOinnZACZPkem8
	C+UjuVtLUCCIYxz98EjsNRWecP8LhWIo7J57YvWMtL49OeyNnjsgd1t/ekJpRVCIj9CS8OqgIsI
	Tack3rEdgBGGDTa1xXvv++tgGW6kF+5htSCy//DiG6UrU=
X-Gm-Gg: AeBDieuFgH3Fl/TrVGb0J7V+of3z9AbyODMPJFtkR7y5ePzbtjmKGaMDcJpCygastE2
	tE74rWfZhtUUqR23Z/SFs+89wMiPmCbUkE0BlkoraS+ddMFed4hOAobz/TBRA8Lo6g0JDLT56ku
	vlOuCl7K9aEt/YYRUEOBgtb3AKDPe2gBxBmIvgYhuNjoLUdblZ7CvPE5lKhjxXuz0tC+k8SUfda
	fwor4OHDEXWXZI1xEp8uW607lqpvbXyJ4m4xsCra53hz+E85/c=
X-Received: by 2002:a05:690e:4299:10b0:650:ece:89fd with SMTP id 956f58d0204a3-65c1b0a4185mr1181527d50.27.1777554806662;
        Thu, 30 Apr 2026 06:13:26 -0700 (PDT)
X-Received: by 2002:a05:690e:4299:10b0:650:ece:89fd with SMTP id
 956f58d0204a3-65c1b0a4185mr1181471d50.27.1777554806063; Thu, 30 Apr 2026
 06:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-1-6ad23e75190a@oss.qualcomm.com> <20260430-bird-of-sheer-ampleness-744e7f@quoll>
In-Reply-To: <20260430-bird-of-sheer-ampleness-744e7f@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:13:15 +0200
X-Gm-Features: AVHnY4I6bR6fdSxJnXBrJdTY4FKOp8Nu9g27U_d0aw_5w0XdML8zMEtBVrvqIXA
Message-ID: <CAFEp6-25Xad_LT8L-HPpOpXf7j1S=Vew=iSgxEmAHd_on+jkcA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: mmc: Document support for nvmem-layout
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzNSBTYWx0ZWRfX2sZM6PwD45i1
 SGljnZd7uU5qDWNnmQY0P7W38SrNyRs6PikdkTAyYI1ncLaI5V3juLaTdjpMscMmrAAwneMuGkW
 c7iPYVPJJ79xKFbWNxkSAil7mDxKoHXy/0+Pw8YKjxklZ7bwcOQSCTk//XxkxGyepG43nV6iGfJ
 r+Fg1ivE1rpJc6gsIgDkL49uxniE+phpwskxxrtUj8Go795EIaJvK6nPilpv0V8faUuiUmwswPd
 F/lcfXGFo+RNraFGWTdLn6LQ+xQ0To0GdKC/Fq18JlFdhmJHVFApyia7E3rUiDyzqHIJJG04lAC
 oxr6WCj/rUXfW/uSrgcVhel96rnDClloYY7ASX3FOKukt21Yxmq1WkeHCVw17+hPZo7kSN36laT
 6VpNYsGtR78foGoR52CfN6eJbze+e0GzlGRwZOMKxeu0LnzdHSOXEBrtNyrC9EA9eZLJtF88ryJ
 JvraolHs+h9Pn0urj0g==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f35577 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=Q8QnmAOcOvJ-T5SqZIoA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: XxzJL6oInrla4njFAtBOOpOlxw0PXJ8N
X-Proofpoint-GUID: XxzJL6oInrla4njFAtBOOpOlxw0PXJ8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300135
X-Rspamd-Queue-Id: 4C8134A33F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,vger.kernel.org,lists.infradead.org,makrotopia.org];
	TAGGED_FROM(0.00)[bounces-105366-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.17.48:email,0.0.21.24:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Krzysztof,

On Thu, Apr 30, 2026 at 11:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Apr 28, 2026 at 04:23:06PM +0200, Loic Poulain wrote:
>
> > +                    compatible =3D "fixed-layout";
> > +
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <1>;
> > +
> > +                    mac-addr@4400 {
> > +                        reg =3D <0x4400 0x6>;
>
> This looks incomplete. Why isn't this mac-base type of entry? And how do
> you address it from NVMEM consumer?

This indeed falls under the fixed-cell/mac-base type, thanks for
pointing that out.
NVMEM consumers reference these entries using the nvmem-cells
property, via the corresponding label/phandle.

>
> > +                    };
> > +
> > +                    bd-addr@5400 {
> > +                        reg =3D <0x5400 0x6>;
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> >
> >
> > --
> > 2.34.1
> >

