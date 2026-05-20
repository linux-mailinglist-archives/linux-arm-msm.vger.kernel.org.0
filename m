Return-Path: <linux-arm-msm+bounces-108896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACAjHHdNDmrL9gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:10:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5959D30E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49CE301F5D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 23:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4B23D4107;
	Wed, 20 May 2026 23:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKkppX3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwH1dwmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951243750DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321413; cv=none; b=ZAmjdcHEwIIav5rOJixNw4LRPD3ZlFbc4R+GXxH/Qkp5T0UQAM3QG/YZ/U9Z0KkUsUHs5jrGxlcbhKWMVEDejwZBbIkGm3DBTi9buqOQ7Fh6MwY6i0cPGnM9pWdxnJ/y4g/bctIg7lvYGYrD9AoNtWZJ/3v2Sh8WOqsg+ygujS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321413; c=relaxed/simple;
	bh=moc/C/hxlezPQ1M+gC9AJqvzkkTyWztlJQm5e3MVXGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH/8WNoaLbmd23XSjapi4wQIc/im+VET29viCYk0Lx3l5VvDYDhyuGwZNSWJJPSFhH/SBmq4807yBAQF40K3hVTwx6fdNWmFGmpyVkia2cHO/ucdi01POC4tsHbqhhf5rkg1d0+y37w4bKHzXCQ/mrW6bfLlgiNi9ZC1Az5wbz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKkppX3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwH1dwmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KJkCrP316416
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HA94vrokU8Taiu6igumszTTL
	8SiU4GRGCJMCNdjBwRc=; b=EKkppX3rRK069sgIL0n4j9+8QXCnTjcL4GZnYTzj
	YRXhQgnMwep/qQELTkj1u98kzF3jdJqIiMrvekfSYSjxciaosIjJccLFwzDDJahB
	8lO9oAh0SJpzA6PhbGVqd9/z/oT5ipLsavRGysfs5Dsi1LnG5KOWMhbRVRzFYtGO
	Vc3WQ/ijCvEgQN9C06WViEOXaqO09KWMYpR+4WW4dkCpzxIEjPXR48zeIQLIePIx
	piNN6Xo+r6Z8z7wCrjcWmqJSI8YOpmkYl3U9u0sxzPNxeMNgoQChGSDdzX1F7kAN
	NCeOKUJ0dSK07XoO+x19ONqjfERxsD97DEJSzNrBdxvggg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qtg1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:56:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso77304271cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779321408; x=1779926208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HA94vrokU8Taiu6igumszTTL8SiU4GRGCJMCNdjBwRc=;
        b=FwH1dwmzaSBjUqlRDe6poZi2y9kp0I/L98RQcm5n5KwG3/EATdpMvbPQ3kK5MICqJp
         ePxg9mEz4N8Pj2NS2TJYUJlAgZG3Mm0pYU3J3dmIvjCHPQ0fBd6C4BAQuikcozfbxJyK
         Le9h9NWvUNS8AYfdqFoyzBwi2p0iFo1TW/dQeODqX3RX/92UTbYhnTBlfaUmeHfdVr/Q
         d6ytlFVZ/gySl90IUvY8ym+dmxnPsCVY3ZsbryJ7j9+wPoRYikNMNf9Xq8OY6EpaJ4oN
         Bml6vB8Q8ru/LNGJyLt6U5XrVVGD9elMDplo/m+vsc3AsN11YFxW5c8t0zFcOqJJbt2q
         EdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321408; x=1779926208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HA94vrokU8Taiu6igumszTTL8SiU4GRGCJMCNdjBwRc=;
        b=ULtnUHxOvEmxYZ0s35um7dEnuRL98U8yvKIaN2cWY7ME88j7upADKBEl5+hGmcGPEN
         oNIN48ytCLUj6x4tHnelk17uVn/vKzTZa4ksji3whrC7MI2rtsiqdJPw1ax9hUZDQtwj
         UEKO8B0x/L7HvAfePT0OC9q1poqRST0rVwq/qzN3XdHWSsgW7VJhKIpgshu/3QTOMY1/
         11erTh37Oriuw0+V2X4nBaCCXIi3MrhYAUXe4bhMRvfzwiqwERd4w632MxUvRG+jx/WR
         kG1cFEbQCpHYMaoGUX2JokxsSy82HzdltJShSO/eVIM3TPg2ldKsmYtKKCq1KWaezv1H
         yZvA==
X-Forwarded-Encrypted: i=1; AFNElJ8Jzjd8ZqzEmFSeD/1cAVxKxYx1rdEEpIaOdwejHaPAvdP138goRXnc2k6xJqrl+uWuNW6SYeDR1KhdjZj6@vger.kernel.org
X-Gm-Message-State: AOJu0YymaP2F8SAaDYOlFpA5sE0JcE2Gu210bNQEKA5bI8KeZcK7OiUR
	78gX/0ZB2NpORpmtN8CzVZExgYCakI/Pc4bEDcO+CznL6MOCGVZgVYw3QN1mONtbhKA3vELSQ8Y
	rNYc0337sJkKCSVPY1KCmLzVQVkDMtydpdp3FOl+pCppBzsKbdxxoZMVzrmEkC0xhSFgh
X-Gm-Gg: Acq92OFXGh0jGV5blHYtuqojfKv7vUoW8naNN42FCfTzgfm+E2qLlPghi/SNBBJ14X0
	/iqrqXVz9CLqqjMmyP/e7EHhPVNsJPXvfcNOssFqTn2NkzBYAvnvAZ8i9xOhRVccqlLhC6YLo9+
	5n16V2J4EknhQYv94WnfiFzGm2Bo7wWdgTolXgfFCQkXkEbdmoB04mpOqK9mM5OJB4aabUTlJgK
	fMYSmhkvNeEBUiSim+rs+thUq9FDlbrNDoaW72Uac99J6Yam7NpvnrlIvwtljZ9lNo+ndFhF40N
	BQELqoSLSKfkXgftRam/bR7lsGURzHfHjwlF3i/REL56MhJ6tJGuZQb2j27tJqY0w8rzP1H/wtX
	ReCSN/57wGUQhG51fYnUd/BAxm3w0fABaXOvsGiV1PhqTrfepGckICXQ5zgTDROGfHIM4dKykl8
	tiLmSOxqDEXG9UIkJ6oE5ynw9A0Bs4ZfxQq3E=
X-Received: by 2002:a05:622a:199a:b0:50d:cd5a:577b with SMTP id d75a77b69052e-516c558d6a6mr10277471cf.35.1779321407750;
        Wed, 20 May 2026 16:56:47 -0700 (PDT)
X-Received: by 2002:a05:622a:199a:b0:50d:cd5a:577b with SMTP id d75a77b69052e-516c558d6a6mr10276991cf.35.1779321407260;
        Wed, 20 May 2026 16:56:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cec52sm5289053e87.72.2026.05.20.16.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:56:44 -0700 (PDT)
Date: Thu, 21 May 2026 02:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>,
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
Message-ID: <nr62mvz6qrpb6moqyasniqcqtfltsx4qtr3lteeixwutindqri@5joujdvn4r3q>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
 <20260423-thick-beneficial-capuchin-e4aaad@quoll>
 <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
 <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
 <7oador7jxw443astffc6hjuf3gots64fqmvsjdsshfhhonc2l7@2unu723p2orx>
 <12e149c4-60f9-4ffb-b066-7611bdd15786@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e149c4-60f9-4ffb-b066-7611bdd15786@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDIzNSBTYWx0ZWRfXwnmuGrHndIBR
 jjmbLl8SMaSi6bB1QB5Ws7Bg82wQ8l04DSPQH+rcUz7TNLAOhJBg+Pww4dCSu1WmwXkH4wsxNKU
 8pyxjd7eGTlNrlOri2nkv4XcyR/mVt+c72N6sghMu/07w0iX6LpA30EPp6wGYj1goB25z6O4Ioy
 xFBknYEHx6dswO69Ibo9RqnFi7ENPjnds3m9FhUfs4DrTld2AFR/9JKMkiwPqPfo3P8idvdAZnc
 8SzffU/YACk/IYYjMrYQyZ7c47RJ5gUS+IRAmhjEVj8uVi12Stt76VSWoltvKlb2LKq8GhRZUrK
 pskntXWgYYGoLOSlYs3WS3Mau9Cenj6NzKeZeAYNvXQSDsH+B+WB9TO0Ngu2b/vt+dM3t8fyibV
 Xsb36bSPmeEFZQWTdBBJjIHsDGxKF2/Nms3nRQGOFICnPZOf314K/9oJWG6FCQoTkJZGpCqagLu
 81gEsU+jIpnQiKkiYIg==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0e4a40 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Qe6B47XUAAAA:8
 a=EUspDBNiAAAA:8 a=4Vwit0Qz_EnXXS5uuC8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-GUID: g0FvIeXaZw3XZy4NkISsjw02mmfS0KjA
X-Proofpoint-ORIG-GUID: g0FvIeXaZw3XZy4NkISsjw02mmfS0KjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200235
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108896-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[krzk.eu:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07B5959D30E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:33:52PM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2026 21:27, Dmitry Baryshkov wrote:
> > On Wed, May 20, 2026 at 10:11:47PM +0300, Georgi Djakov wrote:
> >> On 5/20/26 9:51 PM, Krzysztof Kozlowski wrote:
> >>> On 23/04/2026 10:38, Krzysztof Kozlowski wrote:
> >>>> On Wed, Apr 22, 2026 at 02:05:11AM +0000, Raviteja Laggyshetty wrote:
> >>>>> Some interconnect nodes on X1E80100 have QoS registers located inside
> >>>>> a block whose interface is clock-gated. For those nodes, driver
> >>>>> must enable the corresponding clock(s) before accessing the
> >>>>> registers. Add the 'clocks' property so the driver can obtain
> >>>>> and enable the required clock(s).
> >>>>>
> >>>>> Only interconnects that have clock-gated QoS register interface
> >>>>> use this property; it is not applicable to all interconnect nodes.
> >>>>>
> >>>>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> >>>>> ---
> >>>>>   .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
> >>>>>   1 file changed, 62 insertions(+)
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>
> >>> And unreviewed as it breaks users:
> >>> https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
> >>>
> >>
> >> I will just drop these patches for now, i have put them in a separate branch anyway.
> > 
> > I think, dropping 'required' clause would be the easiest fix. Or just
> > wait for Bjorn to pick up the DT changes.
> 
> Could be, initially I thought this is actual impact on users, but indeed
> now I recall that driver prints "info" message and continues. So the
> binding is not correct.

I'd say, the binding was not correct: the hardware has the clocks and
the requires them to function completely correctly. I think, the problem
is that we allowed incomplete drivers and incomplete bindings (Without
QoS support).

-- 
With best wishes
Dmitry

