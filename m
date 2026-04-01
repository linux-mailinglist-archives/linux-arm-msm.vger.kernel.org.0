Return-Path: <linux-arm-msm+bounces-101358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Bt3OJIpzWnyaQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:20:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCA937C08B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C15D130354A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 14:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C9D2DC357;
	Wed,  1 Apr 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuIYaNXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5zazzxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8F1C84BB
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052441; cv=none; b=Dz8oFrUMNxcadE0uG1zy0B5mnYfQdReffgZeQJWXoCbHjdc0uO3VivK8WVGFamHxzzV7hTzckAFZGNsdOGl5D47D/JJHSQk83LOzHwbX1woepWuqi9cgfK76TIBIa3K/0GUIi6ez7fEP7ThcOQhK0wzt2QO7PsUdER6CetYWITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052441; c=relaxed/simple;
	bh=DhiMO+XuPM6RBLEOGUV7db0Qop+VkIo86iVv2ArkFVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZ9QmbYwtntYgduw0CvGBVeoANHLdMC1rgMY/57GB/JoVaIHv/XKBenGQ3r5bsgzahJcbLp76dxuRylI+RL2J2KHba6+q5/bzkTRmUbMiiEv+V6BstN/9udepI7YliJFo7u38IK3mLHJC69Sn3do8wpWaM2DdbePq5Rr2j8gNLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuIYaNXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5zazzxp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C97YQ4106868
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 14:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B5VR1yslvWwKDGU+UI1kbt9n
	YPu5bCl23Xfy7sUhW6k=; b=EuIYaNXPUOtv6U6GX1ja/pM+XgDOsBi54gpRkmG1
	rwRAsQOrwSR+EPP26hFjwcUi78XtfFclvionyITjPWZLyFzIUX9IKJjXQFtUa3P/
	nj6Z2DM43m0QJaLNkB0uAvzz0MHSyDaizCBscx3azRPZQkhiwtQ416sZw3pvXneR
	sHXXq/StNx/3Ib4oV7xWhBg7fzRQPUSoR7K6Qmct+mPwUeD0PmKYKwYJ3BcSXg3g
	9xF8r03rGyB960Dai/QCO46URLM7nG87MtcZ9kOaiinkUJxlkk70YIEd13VkB9T+
	VpzO33FkZVfvR3XeoTL9QljYYfKkvBr8r3NRaGx4B53Xhg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt91q58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 14:07:19 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ce4fcf89eso18761315e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775052439; x=1775657239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5VR1yslvWwKDGU+UI1kbt9nYPu5bCl23Xfy7sUhW6k=;
        b=Z5zazzxpQc1jLgTt4RmWfEYceUDcPn4Suzu1wZ03zmpein/889ApgPFh8fSeVkM1Ps
         /bBSQJCgEuRoGVE/hut9OhKpLP7giEpGsOX+jUSm/ZpPng+0Wp+yPoKuXB5cXaRWCV3B
         bPCjHnabZrorUR9DXtCfhzHj5YnVt+DTzug1Nu5hZjSKB1fPud4JrNOZTA0jaPWrcpcE
         HdK8Okpujqys5NI7Z9UuFZa8nb4po0FkT/89qXVhfD8lzm+o+TqywBrxnS79mjoUoavZ
         6+QQxEeTUn/gaIUL7MHZ9YY89TT6AoH0x2zYpESa3ax8LpZXG6TrAPxNqx5IaW2nBbEc
         xlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052439; x=1775657239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5VR1yslvWwKDGU+UI1kbt9nYPu5bCl23Xfy7sUhW6k=;
        b=Rb62bUIVtPgw+BjdATS/w9nqhrrp3XeDU/PQ/hgP1bpjuJw5cLVwWZLq95K+Y9WYBQ
         1DSbkNvkye3gw8NO2ljG9wFIE0ppO3vt6+qzddsePW5ZmEMdV6u0+55NnBRJ5+bxm6Yf
         55Z0pkOMuFQEFQF2m97c4hrND/pqL/mPCjSpcdCk5nTYBebnDntjpHUDhUJnRCvNtuyG
         Cy1z4YQeubeWDzha9QK3j8a1y5B0rFKwbxBWJbtudRFB7/lvg7ub3vKhia7ydaQdOkko
         /yIo2zQQDOu2Qs/uM3hBK3wtBUB2D7sYir058BZG/c1dAvbpoAcn6srJtn8yxzq+cBY4
         3G2g==
X-Forwarded-Encrypted: i=1; AJvYcCXkm/ksyS8PSXLHel+k8Z0GnGz78vWWiVxkZz4DoypENi3o/i298oaoupBAgYX105WqK1q47hJ4xnt5mA+c@vger.kernel.org
X-Gm-Message-State: AOJu0YzgO7cDWTx8ALnvwK+afMcPMgiJpfIsfs++Z++sm5U30ByyKtzU
	jwj+lKHDxDzSjOxV6okSSfHXlFW09P9Q2nJOkabJBCSVZzIbZnipw9gMjgndD6nveKcRkRdtAux
	uxb0Tu8w4ujIsFAo8bmWKXwXcWxu6z9IicghfpnWXG8DZNKZ71tQhzbUHYZ1QsbEgteB2
X-Gm-Gg: ATEYQzz9mgaPuE+OVsbDmeb0LB1Ya2tCCvw5AVBWYzQL2wCOX6g7A3DOw2wU7rXkkrU
	jXQmQ3dCmcRyyoBcBZlywjd9CnJWB3XdOQfIEpWntzXKm3gnTbTaeF23Q+0CDTcv253qFoFtcb1
	/9qlzgAxKZqsQvFydFOvNeatGQ+rnNQD+i6U0EeJLeH86sB2njgjZJF2/iwieCj/vw+jDytRcep
	I3eLqEPxKZxVydTLGmPo121jBCTqZjlJu4OMpK3QYJJiRdqU2zYkb/zIDcUkEeKjK/LfpiT6HFy
	cjrOFIjVIzTvC7gT9XoMZ32uwXErnTf0D2BIwT1nwFBx4I5FfGveu/K5CO3vSOLBoYgPG+/fJOg
	KX91ybw+V/HN1AftHU3UEjDd3xuTVSD8VmGbQ17aZXeroj4kRxQQID4eQhoWzdK+3P8yB+E7rvC
	u/OXHpX5B6D5jXBoS19IYISbiQ28GiNyxybbs=
X-Received: by 2002:a05:6122:80d4:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-56d8a83765amr1151554e0c.5.1775052438555;
        Wed, 01 Apr 2026 07:07:18 -0700 (PDT)
X-Received: by 2002:a05:6122:80d4:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-56d8a83765amr1151510e0c.5.1775052438049;
        Wed, 01 Apr 2026 07:07:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c419b631sm511906e87.52.2026.04.01.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:07:16 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:07:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <crlrsxrpzqad2oj7u7sjdtpdxnbdjjfw7kogughydgnlatw7m7@qpytwjgmrzke>
References: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
 <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
 <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
 <4a3887f7-9445-4d46-b250-5fb160c9795b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a3887f7-9445-4d46-b250-5fb160c9795b@oss.qualcomm.com>
X-Proofpoint-GUID: Tjro_ND_ezlM1dDY9wVsUxDg7GlxaLO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEzMSBTYWx0ZWRfX953szYafT/X8
 hmNXTgvPYGjSrfI7QS/fKTtQDTt0BWT69zfluc/FVXW1mnGVlLcS7I2d0f0LsPrEKwYgLM8cJKe
 thJF1MPaV/PZaZfBbAPV+Xc4t07btDY9yV1YYtMMCtRQI7tgwNXH4H4UNRLo3F3K2HSP5pgNtPF
 DnCPLYdilUHhVjKjOeh28TnwWAYvO2tgrRvQfxDZB4iGUfa77+SPT9c0EhkpilyFEV9xfLl4Mk2
 XynNm66Vgv5itz2BIQnDgdbBHP9yceqjpp8L1rJjeWDhyudqb5paLL6wvhcYB8gNi6t/m+sEVyy
 2z/JO6lbPb2nUZ8LmWUKBJfM0dhrFXjMYfs7VT/QvF7p2UdnvpWZmLUHwWoVG/JkS0GhjzH2QGJ
 td8I/810BC0Cdr1sBebqfYyg80Wi1FuTDxIBTzW5+mb+KS9f3EDGJcjh+nRGYh93Q2bNBpQRdsX
 /E+BY9q/bMZsQ4tOZXA==
X-Proofpoint-ORIG-GUID: Tjro_ND_ezlM1dDY9wVsUxDg7GlxaLO4
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cd2697 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=L3hyv5IsywrdO0hFPZQA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010131
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
	TAGGED_FROM(0.00)[bounces-101358-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDCA937C08B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:34:16PM +0800, Zijun Hu wrote:
> On 4/1/2026 7:08 PM, Dmitry Baryshkov wrote:
> >>>>> - Is the pin wired in the hardware?
> >>>> pin SW_CTRL is wired in hardware.
> >>> Granted your three answers, it can and should be described in the DT.
> >>>
> >>>> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
> >>>> which WCN7850 pin is 'swctrl-gpios' mean for ?
> >>>> Why to introduce 'swctrl-gpios' ?
> >>>> what problem does it solve ?
> >>>> how to solve the problem ?
> >>> Please descibe the hardware in the DT. Problem solving belongs to the
> >>> driver.
> >> sorry for not agreeing with your points here.
> >>
> >> it is better to correct or remove 'swctrl-gpios' within DT binding spec at least
> >> for 'qcom,wcn7850-pmu' with below reasons:
> >>
> >> 1) provided that 'swctrl-gpios' is for pin SW_CTRL of datasheet, binding spec's
> >>    both description and its expected usage are wrong.
> > Please correct it.
> > 
> >> 2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
> >>    property have no user within upstream DT tree.
> > There is no "driver" in the "DT bindings"
> > 
> 
> 'its driver' i mean here is the driver which drives the device which is generated
> by this DT node 'qcom,wcn7850-pmu'.
> source code of the driver is drivers/power/sequencing/pwrseq-qcom-wcn.c

DT describes the hardware. The driver behaviour is not that relevant
here.

> 
> >> 3) the property is not mandatory based on binding spec.
> > Which is expected, because on some platforms it might be not wired up
> > and on the other platforms the pin to which it is wired to might be
> > unknown (think about all the phones for which the community doesn't have
> > schematics).
> > 
> 
> got your points and will explain mine at below 2) together.
> 
> >> 4) upstream DT tree have had many such usages as mine which just set default pin
> >>    configuration and not specify 'swctrl-gpios' explicitly.
> > I don't understand this part.
> > 
> 
> For DT node 'qcom,wcn7850-pmu' of products identified by the following dts file at least:
> 
> wcn7850-pmu {
> 	compatible = "qcom,wcn7850-pmu";
> 
>         pinctrl-names = "default";   // config SW_CTRL pin default settings, but
>         pinctrl-0 = ....;            // this DT node does not specify property 'swctrl-gpios'.
> 	....		
> }
> 
> 
> grep -l -r "qcom,wcn7850-pmu" arch/arm64/boot/dts/qcom/ | xargs grep -l -r "sw[_-]ctrl"
> arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> arch/arm64/boot/dts/qcom/sm8650-hdk.dts

So, let's fix them too.

> >> 5) kaanapali-mtp is originally preinstalled with android OS which supports some
> >>    qualcomm specific feature which have not been supported by up-stream kernel.
> >>    so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
> >>    kernel sometimes
> > Again, what does that have to do with the hardware description?
> 
> kaanapali-mtp hardware supports the feature pin SW_CTRL involved, but we can decide
> not to enable the feature based on requirements.
> 
> any advise about how to correct DTS to not enable the feature SW_CTRL involved ?

You can enable or disable something in the driver. It doesn't change the
way the chip is wired (that's what DT describes).


-- 
With best wishes
Dmitry

