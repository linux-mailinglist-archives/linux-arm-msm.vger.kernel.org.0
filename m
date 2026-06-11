Return-Path: <linux-arm-msm+bounces-112822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5AAILDQ8K2pA4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:52:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E1675B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:52:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BdYEYy+A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MFFAHAjX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112822-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112822-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D39D4317A419
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AA1393DEB;
	Thu, 11 Jun 2026 22:50:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488A44D90CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:50:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218240; cv=none; b=k8THwbl+Xlkm+0cURS1Rc+lKzOw7yjzBuJ9iKv9lnU9g5S/WgXn2xCSMnf/G5GPGb+91wZoMKKi4TKIHiyadUzeQSTDm7bPk/ztrpehoKbwdIjrd7EDV04JmOQm/SXziGCcxI0Gbvib4MWxQk/u2S6IDM7dWMmDdwbtx51RSzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218240; c=relaxed/simple;
	bh=s0FsxZ8z5GOCbcGydgexdsiQkwaKpNaoKSvHRYjctOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdshyOi/DU2YvMwBEtd6crcYwP7gn4yGZNWTvNjm7zc9IFrJZuntLZHZ98zFnOIwY4gVvCEQtuwERXJ+l/w1+BFtIbL9w9BUQGfHDaW4ecRYIiEAtwnkFO6sfHN7KsFa0czwLFZdcX9wDsRoJwUhHPCU4iPG7XWRXzY4pZ8NVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdYEYy+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFFAHAjX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMWWL71821667
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mVojuXfDpKf29IEBlpCKnH5S
	CMLDZ9dYiwNIOQ7FYs4=; b=BdYEYy+AJ+/FZImkM0YDehyqVgsMSXFIg2Y5Isy+
	FVhR2Hx5hN95Q6CIJtQdKdMVHog0vWyPoMC3rdNizn+1dlI5wPuCtdyTl+WXK2dg
	ek6kUTHeL7JisGrdckG+S4ktfGJrkc2hyToTITB359sd4Irk2GC+GD1CMsV8LZFW
	u9JTxroA8xiO4XZWkLET4wlgRNkoH6VrwsCtYqVgbehcVUBkLKS1Q+ETeKvRQNxC
	XdDENj/Izj807AUPLH/aewkReNKuGYl2b/ecG52aP6/Mc5tevothfcuReb9e1Dhk
	8DGVdYNB40+6kDUJ0NcRUfmbJQPpn3gEX0fVAivpCtiKrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g8rjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:50:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768072950so3865811cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781218235; x=1781823035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mVojuXfDpKf29IEBlpCKnH5SCMLDZ9dYiwNIOQ7FYs4=;
        b=MFFAHAjX6W+Ck4ExOOZOOVpsBH2zddxd3PFZfN+1W4zO9m3sw1RItG9GZ1DGaTuMa2
         r+5+weiHllDY3W6UFsUmww0Iwp1ZeuI2wI3ipR8hVLr2KzXpthDrdFsGCbsZ3JLM572c
         rgsJZUCltCnf9qmSxNLA+hKDl5VO/EUo+sYSseC2gXgv1XXoSgwkSmNx138TQGhEVM8o
         4q1QCMqnRqzzRwmJIx9uwy5FxUnE1i2tkRzFrMi8hdPG0Vry+6KcozVWF4ahBHmIOmmD
         QZVkwUhB+rkjhRhuDt7NvCesQyQjIxlksP7BhC9CqdBKo+yI4IXSnpG6BUTViaEYuK4f
         LTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781218235; x=1781823035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVojuXfDpKf29IEBlpCKnH5SCMLDZ9dYiwNIOQ7FYs4=;
        b=fg3rLIPlbKjFce1p5RZAJtyqF74JCNMm9R7UfysrIFa7sm71NFr90Pt/g5uICk6IRL
         t+A/AlRjsvXKYcKT3RR0e+j+wb7qQ+k6u/T0xWfjD/tRMyhUoNa5C7v8Bg9HqFUzIfkt
         SInSvPJ0t1vVFN3B5za1swu7qgulKW19W6cm6CwhN1tYC51auaVG+ccHQO3mzL93C+dR
         9eTrl97xsTJfpQzlQgxqjbReP75ydG36G55T0tB3mvPt+RzBrZtwnCvMi1URqxdmLlR1
         cMmcKNiFrj5Jtl5o8Eyf92rEdMrZAKGoUsv7ktHN74QqplxizZvc0parOU/r5Wpbf4HE
         i3nA==
X-Forwarded-Encrypted: i=1; AFNElJ+zXXIp9BuAMRCptKOJmtlsMChFlKDTChWdubCd0w8smemSLp96VfI2HwhS92ngYlzHqVFjq0n7G9rS1smS@vger.kernel.org
X-Gm-Message-State: AOJu0YzaTFdQoUQcN7i+1CY0R7ItXTS6GyPEwi30OEqCNvl3wATQrMdU
	UixmmgXFBptqWg+Zs/MQlaWzKYqD2tyZaNDlrBzB3gFsZelCHgH/dKZbr5Ea26A6dG6QPqTBVDJ
	0GXtZ8ubmaPfz5fl9RD27JiHPQwJFQsugqCUOOgNB5D4vwSoVN8izS+gssReJmLxL7iOp
X-Gm-Gg: Acq92OGTFXP3vobqHgUeBB2uuw8yBf9zaQWms4J3z1fuq+zYue63ybX2HIk5wX6mTvC
	6LaMQ3wnGANHtzF48tVebiFqbbCGZ/EE1N6oXOfhnQmdEaAqTqVCP2J7MqSO3DgZoftfyZb40q+
	b2aka6LTNOdLOK83GcwYzo/SmbL0SWyPM5fVzGEXTYIUkv+YZZG0K/KKwxkRqflsdJmcbWRGhBw
	fS2Kck1NEAcmaCy4O+YLwcIhkyw/xOX0IBfrvkdU5V3xS1FTi3F6w+X1hVW/QwSPQb43siCzA+Q
	SMCfO8ByS6uyGkMZNmw6im8pM6ZrvP3lBv6wtKx9qV/Px0g6n2yDIiikU64DGe8JOElLkt/yOKL
	IRiDiI68J9SScooIu1whdCdqw6oL3T38jEt3gIi2cv2m3xNFgVpPTAhXmde/9ccCQOZK/6ZOKRJ
	u8mjDrWnbrNKacVfuKpt54Z7sYKMoPr/yR3Us=
X-Received: by 2002:a05:622a:114f:b0:517:146d:2db5 with SMTP id d75a77b69052e-517fe4cd259mr2851261cf.2.1781218235429;
        Thu, 11 Jun 2026 15:50:35 -0700 (PDT)
X-Received: by 2002:a05:622a:114f:b0:517:146d:2db5 with SMTP id d75a77b69052e-517fe4cd259mr2850721cf.2.1781218234881;
        Thu, 11 Jun 2026 15:50:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd82c78sm202290e87.54.2026.06.11.15.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:50:32 -0700 (PDT)
Date: Fri, 12 Jun 2026 01:50:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
Message-ID: <6nhhld2c24lbpxrylbzo4qgjqyhxu4pbcwoykwyps3lu4s2dh5@b6cwsomt4jvq>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
 <c5d085d6-822f-46e3-81f4-ef794b8040bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5d085d6-822f-46e3-81f4-ef794b8040bd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIyOSBTYWx0ZWRfX03OjWOumg1n1
 FqO/4Lij2tT3MemnQefkIG2xXXu6R6Ur8Z46oBdGxb15iJHhBgVAYu5WuNIwSRSzlPWSdXyntd9
 S4YrqHpudYqiEIPdp/eOvZlFcoSKEHk=
X-Proofpoint-GUID: DzvC6kxMzHkpzyUR0efC-n2hYN_pIl38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIyOSBTYWx0ZWRfX+njMZW94cQaT
 CW6t+XFdjz/YWEYjkzzBGB/GGn8Q0IJZf4KItfSKuX1IeJFMUeYA6jHRhZQ6toSFtsJZJfOym5L
 FMAl55vFjclfyvD5/QfIs4MQqkPHlws0zia5q81rHn8kLrL1EB++rMED4vVIvePsJjtRRBOvM8u
 PrHQwCY89RLfTxT7Tlleue7nkZZJU7AHta4w4ueVdIMILKkarGvA5LZEoapZpuYtqcar0wHxmvG
 XuvofcuY0rbse0zM8BfZiaQOGn2BzAbUmgK9OxCe4hGpcmje/y8Wz4ogoHNuI5asSTdo6LDBEcu
 ry8umggUY0ljUBiFWiCWAGoMQZPdPn/8eFXYpoVyVAjN+slweFYBFv14AV5XftUHrNtw8jTEAS/
 +D1AoHAQJWArs4imtTU3iU92YTo+3/eYucGd978YBJR4aE6G/acQbvgPIqCXh6XowY/VgXMjSM4
 58+c/nWuhbn7jQDQa4g==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2b3bbc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=84pVzkcfbc7hDzDTJfQA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DzvC6kxMzHkpzyUR0efC-n2hYN_pIl38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112822-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,linaro.org:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 270E1675B67

On Thu, Jun 11, 2026 at 04:23:40PM +0530, Gaurav Kohli wrote:
> 
> 
> On 6/9/2026 5:00 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
> > > From: Casey Connolly <casey.connolly@linaro.org>
> > > 
> > > Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
> > > cooling devices backed by remote subsystems.
> > > 
> > > On several Qualcomm platforms, remote processors (for example modem and
> > > CDSP) expose thermal mitigation controls through the TMD QMI service.
> > > Client drivers need a way to discover that service, map DT thermal
> > > mitigation endpoints to cooling devices, and forward cooling state
> > > updates to the remote subsystem.
> > > 
> > > Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > Wrong SoB chain.
> > 
> 
> Thanks for review, Ack.
> 
> > > ---
> > >   MAINTAINERS                      |   6 +
> > >   drivers/soc/qcom/Kconfig         |  10 +
> > >   drivers/soc/qcom/Makefile        |   1 +
> > >   drivers/soc/qcom/qmi_tmd.c       | 604 +++++++++++++++++++++++++++++++++++++++
> > >   include/linux/soc/qcom/qmi.h     |   1 +
> > >   include/linux/soc/qcom/qmi_tmd.h |  23 ++
> > >   6 files changed, 645 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 57656ec0e9d5..3d60702a655a 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -22286,6 +22286,12 @@ F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> > >   F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
> > >   F:	drivers/net/ethernet/qualcomm/ppe/
> > > +QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
> > > +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > +L:	linux-arm-msm@vger.kernel.org
> > > +L:	linux-pm@vger.kernel.org
> > > +F:	drivers/soc/qcom/qmi_tmd.c
> > > +
> > >   QUALCOMM QSEECOM DRIVER
> > >   M:	Maximilian Luz <luzmaximilian@gmail.com>
> > >   L:	linux-arm-msm@vger.kernel.org
> > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > index 2caadbbcf830..a292ce57fd4a 100644
> > > --- a/drivers/soc/qcom/Kconfig
> > > +++ b/drivers/soc/qcom/Kconfig
> > > @@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
> > >   	tristate
> > >   	depends on NET
> > > +config QCOM_QMI_TMD
> > > +	bool "Qualcomm QMI TMD library" if COMPILE_TEST
> > > +	depends on ARCH_QCOM
> > > +	select QCOM_QMI_HELPERS
> > > +	help
> > > +	  This enables the QMI-based Thermal Mitigation Device (TMD) library
> > > +	  for Qualcomm remote subsystems. The library manages TMD messaging and
> > > +	  handles QMI communication with remote processors (modem, CDSP) to
> > > +	  exchange mitigation state and apply thermal mitigation requests.
> > > +
> > >   config QCOM_RAMP_CTRL
> > >   	tristate "Qualcomm Ramp Controller driver"
> > >   	depends on ARCH_QCOM || COMPILE_TEST
> > > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > > index b7f1d2a57367..4544e61c74e7 100644
> > > --- a/drivers/soc/qcom/Makefile
> > > +++ b/drivers/soc/qcom/Makefile
> > > @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
> > >   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
> > >   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
> > >   CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
> > > +obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
> > >   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
> > >   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> > >   obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
> > > diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> > > new file mode 100644
> > > index 000000000000..9d88ae48c864
> > > --- /dev/null
> > > +++ b/drivers/soc/qcom/qmi_tmd.c
> > > @@ -0,0 +1,604 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2025, Linaro Limited
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > + *
> > > + * QMI Thermal Mitigation Device (TMD) library.
> > > + * This library provides cooling device support for remote subsystems
> > > + * (modem and CDSP) running the TMD service via QMI.
> > 
> > Why are you limiting it to these DSPs only? I quickly checked, my X13s
> > (sc8280xp) also has one on the ADSP.
> > 
> 
> Adsp is low power dsp, not prone to thermal issues and no TMD service is up
> and running. So we are defining for Cdsp and Modem only.

Again, if there is no TMD service, what do I observe on my laptop? Or
what do I see on other devices (checked on SM8350, which I had at hand)?

# qrtr-lookup  |grep Thermal.mitigation
       24       1        0    0    22 Thermal mitigation device service
       24       1        1    5     9 Thermal mitigation device service
       24       1       67   10     9 Thermal mitigation device service
# echo stop > /sys/class/remoteproc/
# cat /sys/class/remoteproc/remoteproc*/name
adsp
modem
slpi
cdsp
# echo stop > /sys/class/remoteproc/remoteproc0/state
[   68.353571] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI write request: -5
[   68.354150] qcom_q6v5_pas 3000000.remoteproc: Handover signaled, but it already happened
[   68.503057] remoteproc remoteproc0: stopped remote processor adsp
# qrtr-lookup | grep Thermal.mitigation
       24       1        0    0    22 Thermal mitigation device service
       24       1       67   10     9 Thermal mitigation device service

So, obviously, there is a TMD service running on the ADSP.

> > > +
> > > +static int qmi_tmd_get_cur_state(struct thermal_cooling_device *cdev,
> > > +				 unsigned long *state)
> > > +{
> > > +	struct qmi_tmd *tmd = cdev->devdata;
> > > +
> > > +	*state = tmd->cur_state;
> > 
> > Mutex protection?
> > 
> 
> This callback only reads the cached local state and does not perform any QMI
> transaction, that's why not using lock here.

And what is protecting the cached state from the concurrent
modification, ending up with the read of incorrect value?

> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
> > > +				 unsigned long state)
> > > +{
> > > +	struct qmi_tmd *tmd = cdev->devdata;
> > > +	int ret;
> > > +
> > > +	if (state > tmd->max_state)
> > > +		return -EINVAL;
> > > +
> > > +	if (tmd->cur_state == state)
> > > +		return 0;
> > 
> > Hmm, again, mutex protection for the cur_state? Or is it provided by the
> > thermal core?
> > 
> 
> Yes, it is already protected by cdev->lock.

Comment.

> 
> > > +
> > > +	ret = qmi_tmd_send_state_request(tmd, state);
> > > +	if (!ret)
> > > +		tmd->cur_state = state;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct thermal_cooling_device_ops qmi_tmd_cooling_ops = {
> > > +	.get_max_state = qmi_tmd_get_max_state,
> > > +	.get_cur_state = qmi_tmd_get_cur_state,
> > > +	.set_cur_state = qmi_tmd_set_cur_state,
> > > +};
> > > +
> > > +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> > > +			    const char *label, u8 max_state)
> > > +{
> > > +	struct device *dev = qmi_tmd_cli->dev;
> > > +	struct qmi_tmd *tmd;
> > > +	int index;
> > > +
> > > +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
> > > +		tmd = &qmi_tmd_cli->tmds[index];
> > > +
> > > +		if (!strncasecmp(tmd->name, label,
> > > +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
> > > +			goto found;
> > > +	}
> > > +
> > > +	dev_dbg(qmi_tmd_cli->dev,
> > > +		"TMD '%s' available in firmware but not specified in DT\n",
> > > +		label);
> > 
> > If we can read them from the firmware, why do you need to specify them
> > in DT?
> > 
> 
> We need DT, because cooling-device binding is index-based as per new thermal
> framework changes:
> https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/
> 
> And also the firmware list is name-based and ordering is not consistent
> across platforms/firmware. DT provides the explicit set and order of TMDs
> that thermal framework should bind. Firmware may also expose
> additional/virtual TMD's that are not used for binding with thermal zone.

I've asked this elsewhere. It's not clear how different TMDs are used.
There are comments by other reviewers regarding the tmd-names property.


-- 
With best wishes
Dmitry

