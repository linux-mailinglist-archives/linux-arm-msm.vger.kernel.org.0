Return-Path: <linux-arm-msm+bounces-108879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NPdKxkmDmr26QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 23:22:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD62259AC39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 23:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FFF93022653
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C73346A0D;
	Wed, 20 May 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EShGzp/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2tZlfo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A321A8F7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305278; cv=none; b=H/HiFJiwaaF7mJ7OLmfTR3OnYkkp5UCxJc84ty+UmpqOUdyxwkNlHzOQJYNKW0iha/J3gZhCo2Lfjs/rrBtdh2flI56UzyjaRMf128xqws+7cXUgmWPrv12+zRd2ri76u2RmJI7UAtw3/z93KSVE4CAYJjduf5KJ9+mCbc+eKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305278; c=relaxed/simple;
	bh=yt8U84SiDNiOBcj3+VaG0c0qI29ReIVNRDRbFKUrqeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGfUnCQXW5mQL2FmW1GbUFZNYckvDHB8O+3p0OD3Y6Gi+itZ5nSrZjwlf0rtn70VtfJnbQzTJlcqmH6H13roNpV0lWgnK6IIbtBliL8ii2Z6Mc3Mo28DYMNWBbsnSgL+ZeUdLrAqjC1JKziCuYnw2H+v0wHlyynFivuOj1E+Qqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EShGzp/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2tZlfo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KF8DWf748397
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cof4BFpLE8vZCh1gO98ccWcI
	wNC66MDdBlVTZ4MDiEA=; b=EShGzp/piJbn2vB2HmeCAIC1oZaEe0Ci7oZxhdl4
	SmFFJo6uDuGCpWhTJfCssLC54nTBO7yo8LHU6ss8GfTbeHZd/quCgo8TX+fSGbXk
	ImdT1yjKVdfi6T6+AwngTd4twe5Sk0j64yY/Ex2iUWsiVOJPE92e0mIrQYLCiXD2
	2BlqrxeSpkigYdNkfF/dyThRbu8R96ZjmhBsF/HULl87qNmw6jktX/eBLZA4PHqM
	6Xlgm9ESGLCqWvxfcll7hmIseSVQOAee1hFmcPCe4LKAvQQapEIJYzNT23HixFxI
	Ayl/vCHd1McTYlqhKpn4WPIOSPAyx6mBq0CE2pY+rMTnNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6h2yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:27:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so152403721cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779305275; x=1779910075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cof4BFpLE8vZCh1gO98ccWcIwNC66MDdBlVTZ4MDiEA=;
        b=K2tZlfo5hUm5HLcfYaBQRlcMbdvQqmFrKRhk3BM4NYCuMJ0qfVNtZbWBf1k93CUhn8
         ejaHQ+yqHRrA08x+MjzexXf4DJb57CvnfphuytFrbFD6SX4eZPCmCZnniPDYAyPUjK75
         3Zw3XHh5q5/VuVPDP87qaqxBEltn0F0kZKlhl6TThx+Fo8/C2IjytrvpB23Y0kvpZ/qh
         F3ayiZaVXDdHsLG/o9QJFGweHuahWovUM4qEj1dbWn24F8GMQngNXLO9BkMLhAvYRir7
         6Bdr6dbSeD3rD56uKPwPiFNAdmPF0QvJaO8GT1+xX1J0vwuHvUSxSuKBnB/oqZLJkAmC
         UbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779305275; x=1779910075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cof4BFpLE8vZCh1gO98ccWcIwNC66MDdBlVTZ4MDiEA=;
        b=L+wftiS05mx2Gyij8ItwsPVlIAo0hxvDsj72UFTCEsgjp8k4MgVKnZosieaRixP4oh
         eTgjdoxH1H4S7YFZ+c2lxMhYcGiHRWXzLlUyR8qjIi0rjjjPJaIZQMr2jah1JAhRTB2r
         67yILbV5DMoissfscoAaykFjp0Ua1ncgr45GbxoJuifjawvV4kyXdrKKgjXgG88xMC7R
         qGfotchHhAMNHxMIGmSQDKM7Ohe+lZ9zfI4GjwDmjhmbWCJ4I7kyo+4z+5MbqJjjPt4V
         mtnr0P2KEi7+f8gtFhoc4+jgMqe4j40eW49BJAMGdLJnlOs0/mv43Lvb5z/ldYjjBZKJ
         viYg==
X-Forwarded-Encrypted: i=1; AFNElJ9PwU8GSARJHsKebgX7oZgEjHF1SJeikEOpNMVvgLGMM0QP7aHj0Q3BU8CXSMTDSslhEthJmb+xo1dUt+sJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXskfBlJGHkSHyGU7ges5aXWTo/z83yGsHbfgxvTL2ZPwSXWSy
	9E8bHobZO/Wnoe+DpVJtrTAq7gy7RGT/6lzuHwTtVO68WITzcrPzdS+Hm2I+um9+b6OOy6R2PxM
	kCGldUlEwtLD1fPMj7kTnWq9skYcFOE+MiYtl1fdwdR0ZMvfaKL+keeVhZkZWzUe+J1whjTvF7m
	uM
X-Gm-Gg: Acq92OHIaCM7lmufBUw6hAQseFHhYj34EZ2IjPSGHf8AnpptNfdeUKDJc8TSh+6Onkr
	ZtgFR0qfDIvxQeeUi4dltUmcIsCj0WS9ofbQi/aHgtQVWv2TqqRi9Z0TgTjDKTKsNGmTvfLnv54
	lTnvChaKrVZ1YLv84VJMvtWJr/YcdkkCiC6naGjsDaUkpwvuN0UHDL2S9JtbGv/4iYbZ/WeGVKP
	1xk924GQn/ZqKnAUyaqoEkJOtEn+u1IwfRaLuwO5PwWGygmL2o6HqZJ9JZFMZq0Xocsc+hpVt3Q
	FcpJh32/uIrpu76V80spe5AiG88SRB4pUoJvHZE+/EZM/XFsnFzbKDyadsNpgd21htS2JtoSIM5
	QpaDiZ7AK4qA+rffXwpW6Twr3ausWa9HVlQEzqI4VKY8jvh5H4uDenIsLHzyzS9uhjFkwbQ0grG
	CLdg39qFxyR86HB4VvC0QKMVd2XIC2w9f+V7g=
X-Received: by 2002:a05:622a:3d0:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5165a20d00cmr344523611cf.43.1779305274388;
        Wed, 20 May 2026 12:27:54 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5165a20d00cmr344523161cf.43.1779305273869;
        Wed, 20 May 2026 12:27:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c74d6sm31850691fa.15.2026.05.20.12.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 12:27:51 -0700 (PDT)
Date: Wed, 20 May 2026 22:27:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
Message-ID: <7oador7jxw443astffc6hjuf3gots64fqmvsjdsshfhhonc2l7@2unu723p2orx>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
 <20260423-thick-beneficial-capuchin-e4aaad@quoll>
 <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
 <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0e0b3c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Qe6B47XUAAAA:8
 a=EUspDBNiAAAA:8 a=mpWlrPG02yKYcU8NnnEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-ORIG-GUID: QyuOZ7--Cf1xoZE0eZJU7vrA-dvYZTA3
X-Proofpoint-GUID: QyuOZ7--Cf1xoZE0eZJU7vrA-dvYZTA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE5MCBTYWx0ZWRfX5zUFYMmEFsyj
 A6iC5EXm8bpNc32Cc+/cWRcTUUgAiSIT0QGwbRmwddQipgJzYzPBivTn3ZFxvD7fgPiwrcnkLvx
 4ABzAEddVMy+Y+a6R5ZADEgaGl45eEBe5H9Y5gE5fDVNlQZ5WsqzKeue6TECq5vZcuI8hM6tLN8
 qLVVNMwt83Dt1J1giKExp71nxxDxmf5w45Q0ekA9I3VRq58XMqkb0DWGvGyLo0c2zkkV/TW6MQK
 xOCGEOFdC/Ux5xWIg7j2+ycZbBmn2VH23rL/2f0k1KuVH3E4hLdt1vmbg/LlWPyTEbyJq2A2z2Q
 RRjgum+v0lVpmffcmHWoT5WxH2kZVu/03sDNXFkVG0BEWkD/OUUdxcd5q6/s+bZTeKqCs4xiTxr
 puAmr2H0ysWeXTk/vXd3TB36nqrvp2GNkOJj0W865zLL0laeiHbH/6k+vTfq4lA0Zebmf+R+4zt
 WlM6/q9Nyc6mOVoYyTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200190
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108879-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[krzk.eu:url,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD62259AC39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 10:11:47PM +0300, Georgi Djakov wrote:
> On 5/20/26 9:51 PM, Krzysztof Kozlowski wrote:
> > On 23/04/2026 10:38, Krzysztof Kozlowski wrote:
> > > On Wed, Apr 22, 2026 at 02:05:11AM +0000, Raviteja Laggyshetty wrote:
> > > > Some interconnect nodes on X1E80100 have QoS registers located inside
> > > > a block whose interface is clock-gated. For those nodes, driver
> > > > must enable the corresponding clock(s) before accessing the
> > > > registers. Add the 'clocks' property so the driver can obtain
> > > > and enable the required clock(s).
> > > > 
> > > > Only interconnects that have clock-gated QoS register interface
> > > > use this property; it is not applicable to all interconnect nodes.
> > > > 
> > > > Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> > > > ---
> > > >   .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
> > > >   1 file changed, 62 insertions(+)
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > And unreviewed as it breaks users:
> > https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
> > 
> 
> I will just drop these patches for now, i have put them in a separate branch anyway.

I think, dropping 'required' clause would be the easiest fix. Or just
wait for Bjorn to pick up the DT changes.

-- 
With best wishes
Dmitry

