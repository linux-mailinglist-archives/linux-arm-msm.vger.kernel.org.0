Return-Path: <linux-arm-msm+bounces-114763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CG0uHOYCQWrNkAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 13:17:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AB66D3AC1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 13:17:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TtHxviPO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SKjpTPgU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114763-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114763-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A2943004DA9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 11:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005C23A1695;
	Sun, 28 Jun 2026 11:17:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C412E6CAB
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:17:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782645468; cv=pass; b=HL65l6IpubM1G0vNr3z+h98z7hg9bqKT4GbeFhcSmk4/BlPIp6rmjolHUa1C+MHnQQC8w0ahWnYoKUw4tXlUjOUUcFERdEsLW9Rb2AHaj8WixO/IDd2e/19TyziAhDOw46DuBGxvcmT1Al5ANeTM3j53OjtmOUrihb16lApuFuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782645468; c=relaxed/simple;
	bh=/Rom9OzbBDvzqL47K6L16xkbWk+al5r08XLPE9atwTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLhpbbQ7pMImqMsmSPnEs4Mx72Qhdg6Wa+xjgU87dbymiWDkjWeL8q0WBQplruO9xj57Rxi/Pouibu1U6T/RUtTaubhLWx2BgoYZ4m12XdaY5iTETV0/oSN+Jpv+NX9tgNCH44YuDV2M3/PESjgEOGfdhDuByZTwm0ckntgzVao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtHxviPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKjpTPgU; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9Q5e03592964
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08H1iIchRh/u7bYE0GFBizac
	WQgfsaPUywhrusHq414=; b=TtHxviPOQTL9MqGBZEIEoB9adv24VdofDwdz58Vg
	OFyiXkmxHK/xu9KlGy9Kf+kO4W69fV/upj6OTYdz3ifPQwK9hQ4NWu9tyw7tXBFq
	54TxOmkZbyQNBWYaJ3K/gYGSk3c/VtXsdu6S9lz7EyiqwF5VDUPpHs90C6ESG8i2
	DscUvCUL6qYIyaXPheHvznX10ZXw6kNyhKuYK5YM8FQqcucSW5KdhgmdqdC+yaiI
	3lO4fRh2U7xEnOLy1/aJ5AERBO5rNllC0EKQf4VPLSOoSJcmKLFug6qAR3ZDLuwi
	0ejVGLgrQDFS3Q1LQvVzJAY9Z1UuV8nWS/VUr/0tAf+Z1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf2nbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:17:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fc0aaa94cso578422a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 04:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782645465; cv=none;
        d=google.com; s=arc-20260327;
        b=jhW3wfx+Lez6inRrXYppv2HE5kKRbQuh3m93D55g4+YD9MNO7vxf3g9D86tNS0X99l
         VUygwcKXyZNG1H0Y7t2AkD6lsGZL8nj/BM+O/Oxe/Bqn/FAFkzXFU38yYjjOHuIvtZ7V
         Ah2hNa3xpIP1tAlS+kLqwWSL1LnHOMotElMHsuDfIdpdcKZh3S/INxAtTS/FA56kV4Qe
         YOctWjxPcp9KwgpVHFV/pM0/vEszrI96E0cqvEkBgx9a3qi4z0cXvIZycZr5KJI6FvLP
         P62tn/xwSsSpp/rZG1/22Fkmd9Hx4+gxUk85/ZGEP4jUQq1RAf7S1K36kpbvkl9+9ak6
         lLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=08H1iIchRh/u7bYE0GFBizacWQgfsaPUywhrusHq414=;
        fh=6/r9PfI91qpZArLfSTUdyjtWg+qBcpVP8CC4nYSCXjg=;
        b=ZWMcHltFhNAonblESanzuKIgqK3HgPyWJJYse/VbBHzTjPUe5D4AYdMgmZmJ9UjuDv
         XxrGseDm/GVvJZQkCJTgOxSxbosYa9LReTB/tmXXL/65x+/RCxXT/XxvOEIxeJQg+tdi
         MU3RV7Sedk6PH+rigEFbo8xrlj5bcKNHlVOmKKKt4ppY3aQWm/OMlgIPH693xuWwtG7n
         fdQ2tfMLCrDROZzUfpVv50zdsY9xXvL5oPb8BzTXdVERvwmOGi4ck2sbyyE0ZKhPdtFO
         7n3ehYFMyYN+Xde6B+upJv2zdm9Quu10Fk4iXn9Oqn9O6S1nPvyWVwuhhZRhK27pwRwZ
         be3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782645465; x=1783250265; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=08H1iIchRh/u7bYE0GFBizacWQgfsaPUywhrusHq414=;
        b=SKjpTPgUGY5sFI052cjMVYnF2i/NEh0t9gnEniKefGnVjoUh/2K+2rokZ12ZFDplZu
         yTF/IkYS7z08OuXEQYIm8qO4YeO9yrimBD5mdDgfz5J0xX2+FmnQ9ha3QI13SOQ64qo6
         N3FeRvBc5n0sKXXVFV2cNNYfDPLNPdqdU+lz1nF0iqaBVYwz3plxmSUyo0r2CyN2+NxL
         KAHnEO9lsM2H7hX+uaNVCyhPJVVMou8GJDeRQk3Nr20dQRMvxHAJhTGIMBdQ05rSvCiR
         8XxUjvCzhthGKwdWPEVigBtj3h/E8TbXA97VldytekXuza2sLgpybtjrfHcoK6cNd/sX
         NX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782645465; x=1783250265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08H1iIchRh/u7bYE0GFBizacWQgfsaPUywhrusHq414=;
        b=F3gDxyPeQCP55eAiBbEgqVhS3e6eoPNXe78dSM+82IsLevklMSIoAVwn42x/ZKmqdy
         V1SXLMpHexZPNe3/cu8kZnJYom1XRNebN8wcXh7R2/5lS/72gJ91igZrfMVVTz/GKjgd
         VsLQz/CDIZh+IMg+GBlLMxQFkCElafHGDfhdRFX9iGq8d5KYXaRgmRzdbG9/XDKhpoEg
         Y4xWlov///lGMH7WEojI7iDHUp3LBjzZdNrhqahDOPDnBsVt73s2otV67YFnARGoRTWE
         k35asHyWC51dU2xZ7VHMZzyNLDI2JqsRJ9Q7sJ4cAws7d/YtrUoszdALOgwCg8QQi29X
         lnWw==
X-Forwarded-Encrypted: i=1; AHgh+RraL6kgGkh8JFE236o0MCA9h7rK+16dJ8BOpC8UboCeXLTds3M5MrjXxoR83ExQoeqCDiJvEEj9njyR6kW6@vger.kernel.org
X-Gm-Message-State: AOJu0YzPR1U0/axvcqvVvyywIjvS1Ei9E4j38+vGN1UWtXtNGKq4x4hR
	hktLAHkBibG6EGycFISvUJVNWb3fhwtKjwDdbjGGQImd/vd6EgCF04UrhQ4LAQNFDl+sDxUpnk1
	YqIDFEq0NWxogq7ENcJc3PN2iUpICyv+4oVSXkE2RRMogvfDOKaDKNawwJsJOImvTV2x+DoHjKe
	u4O0SJeCw6mLI7j24y1LjZFj/ueyntPXNqhNAzKPEhqoxji9UgPdQARQ==
X-Gm-Gg: AfdE7cnqVarv+TLJmcEeB68DiV4JJ4xyPJ99aQIY8JJABTspEBB6l/MOY3uFnlUY4CT
	Cz30TFGLp0ETPXOcYOhhyFR1E8bCDLgYW1FoLlZNQ90cIuixi1nVSWrIwQJaut/Dj5/CkbqmGfY
	2FE2XG+pUvC8z0RkF4uZ4ycZZroQCN0gH+RpHQcpyqni1yMsmIOC887YnCmn1/T3U5nVWwclm2b
	Llx1Fi71Eitlz561fYgUGWW6CfHhA==
X-Received: by 2002:a17:90b:3fcf:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-37f817e509cmr5371904a91.25.1782645465310;
        Sun, 28 Jun 2026 04:17:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcf:b0:37e:2053:348f with SMTP id
 98e67ed59e1d1-37f817e509cmr5371886a91.25.1782645464763; Sun, 28 Jun 2026
 04:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com> <hej6absxu6nsuktv7tsegduyrduv7diq5zx7dt2a4xp3pe6gxl@b2xscorilbvn>
 <akCFlxiGT-vHNM-x@baldur>
In-Reply-To: <akCFlxiGT-vHNM-x@baldur>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 14:17:33 +0300
X-Gm-Features: AVVi8CcoKIG01MrYDJCZXznA7AF4_rDKObCyVvw0QuDn2wAQl--Q8li2DLWAFHg
Message-ID: <CAO9ioeVd=fcd5SF-J8Vo9DNEz_QzyRvo25-7i-FxGUv3j4qbAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kodiak: move dp data-lanes to
 SoC dtsi
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDA5OCBTYWx0ZWRfXzxPKHKxI2z/c
 JKZKOewFl0inZWlXHshxPlzbrWCjKcwMHlqStUc01h7x29qgGY/9ztFO8EVBhFtJ2eV/w4Okoi9
 9zS2fu4QhfIkE+wi7YHlysKnDFkPwoA=
X-Proofpoint-GUID: 87HhrCDxKIJQ9Zx1U238DzIig-aBybvW
X-Proofpoint-ORIG-GUID: 87HhrCDxKIJQ9Zx1U238DzIig-aBybvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDA5OCBTYWx0ZWRfXw5JsflKXNdzm
 4kdP6CtanYMSGL0ZL1cCYyrQCU6B/ZEBI9I/+RxOgF2LnKakPsMeinWOQNGC8AHf0Qa8D97X6RG
 4o1pCdFMi0sKWn1a47G1qwhurErrmxVkyiHPOK4OteMhDGKqGlDqPBw4dW1x8LaQ2l0m2nrrU2A
 9psL0+jG/EGVWc3TIrLnKardSXAYAQ+JG8iqPwUJiRZvq5g2CyiSjbOtEvCwOhQdMWl4K81jZBM
 g3mWUVKPPKD8mqBmHiGQYoRgkKdMn3Md7VHaVhEoAoPOMZH4VVuriceY+S+O1W6pTjSVDUyJzoj
 /ieG3jGLkiy8dOY10zSh1MNWUcrWTh4UDbuZJrA2VPSPocn9jxan/BDsRyMoH1mHGCbCSELW58S
 vKeQSa3f2eVHaOpXkv0XzHqAAOAb6tmz/RcJCVGSQ+NcKyG73mUtt/veQKWxwOjvMgS/Z1XxTqr
 26GpDPO+gvsfLaHywxA==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a4102da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Dppsg50_g3HS2MGcJhcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114763-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mahadevan.p@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68AB66D3AC1

On Sun, 28 Jun 2026 at 05:26, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Jun 26, 2026 at 11:50:40PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 29, 2026 at 12:10:41PM +0530, Mahadevan P wrote:
> > > From: Mahadevan P <mahap@qti.qualcomm.com>
> > >
> > > The connection between the QMP Combo PHY and the DisplayPort controller
> > > is fixed in SoC, so move the data-lanes property to kodiak.dtsi and
> > > drop the per-board overrides.
> > >
> > > Also remove the redundant remote-endpoint cross-links and
> > > orientation-switch property from qcs6490-rb3gen2 and
> > > qcs6490-thundercomm-rubikpi3, which are already defined in kodiak.dtsi.
> >
> > Separate commit.
> >
> > >
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  1 +
> > >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
> > >  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
> > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
> > >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
> > >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
> > >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
> > >  7 files changed, 1 insertion(+), 24 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index 96ac3656ab5a..0acc6917d7aa 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -5704,6 +5704,7 @@ dp_in: endpoint {
> > >                                     port@1 {
> > >                                             reg = <1>;
> > >                                             mdss_dp_out: endpoint {
> > > +                                                   data-lanes = <0 1>;
> >
> > This is not true. The SoC has 4 lanes going from the DP controller to
> > the QMP PHY.
> >
>
> Does this property really denote the number of lanes and mapping the
> internal pipe between DP TX and PHY? Doesn't it tell how the external
> mapping looks like?

The external mappings are described as a part of the QMP PHY (see
sc7180-ecs-liva-qc710.dts as one of the recent examples). On the other
hand, this property should describe the internal mappings (i.e.
platforms should have 4 lanes here, in some cases in a weird order,
like talos.dtsi).

Ideally SC7280 Herobrine should be updated to follow the current
style, but it is complicated as almost nobody has the actual hardware.

-- 
With best wishes
Dmitry

