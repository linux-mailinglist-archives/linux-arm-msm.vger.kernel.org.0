Return-Path: <linux-arm-msm+bounces-118824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S5I3AvQCVWp3iwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:23:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24E74CFB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 17:23:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LCoEhvCl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IcZkyamK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118824-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118824-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D925831677B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22FC40F8DF;
	Mon, 13 Jul 2026 15:12:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A03749FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 15:12:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955559; cv=none; b=kRXKEx/1yvM7PmGYZQX7ot77ILC324dceIDxwTrPKOkq1GYm1dxUGpUe2eASDyy5bocBRQP7aaG/XPFwxpoLNJfUDjN+5bhS+8cUbBpttam3wrW/qxS2TjWz/BvcEUcAg7zKaK8anYtz3ntFySysmlEvNxhzNS+D4n0c5hUmgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955559; c=relaxed/simple;
	bh=THdxXOpdFuhhFnipAcQUfG5QULGuIv4YZ82LcNBLZXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+IAqHBGzSWD1JCuO6xU1HY4vCSpdZVZqkXSNymKHNSNoO+WsQGLz0wxCQGOhT/fd5ivpfJ4isk8+3DicaF8aJrOpcQJRCo8L89bGoejEopK4DNkPPMiD44gmC/UAXvlhgy3w+q3kfM0zs6J5qFg+oRMsDhmCsRxKoNvUgBxMSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCoEhvCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcZkyamK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF89gH1968292
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 15:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UiRg8U2AaGqyyMZqfViTPDep
	cCtkMQ0GgYtugq6N4hU=; b=LCoEhvClpTbQW9EbXP0OZtIPAzJBe8IK7PTKBEUH
	Y1sw0gvJgLZaqtbyw/NGVgxQ2sf9Wi+kCK0GxufxfYCderTTvNfVGxnq274GNkYW
	nS+ZOaccxQta2sLv/X3Aqx0AmKpyCl+3dgxZAabfOze+nDSsD3OfBz+7nwDa05Ms
	R2FXy3OFTLu434d3ipRS0PEvfBdN6a+WUxCgjzzsOCv+7NazJHVoX8KTY4WB+yJO
	Hz/kEqab5AFtsdL43N6opxGmraFMownqQzhG6XXgFF16O9XUvZf5GRM+312zZ8lL
	DPvQGJM/YVvq9nOC0vsblrUgFd8TVjsnuB83BUy2p0WQBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b6qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 15:12:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484b57b98bso6461533b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783955556; x=1784560356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiRg8U2AaGqyyMZqfViTPDepcCtkMQ0GgYtugq6N4hU=;
        b=IcZkyamK36XmAUhW5VXiZloyWzvrMUha7nvN4e4TPF5bRc5XiBJ3PTRtWW3ApC3nxr
         pIGHqejIjSu4e5vUgrcAqcvtgBRfQVJA6jJ7farQAdC/Kez+eFto4QVOPEQb69AHaUXT
         jjOoJqHJuBxYWlQbX4bjcOZqOqmMJlIAzslhWGGVKZnYoYgAdocIDRG5mAwlHzFs9k+h
         pXWdhyuaswtSX8VhzCObp5T+PwT1Lofp/oo+Bx0K6Sm0KPAmzQTVIXTiTiODNIeO6j3Y
         7RijWMEhAYY3sr20c3DKJWwV2G3s8Q7n1ykAKjmFGzPqqvIgzFtEvPLlwwjYlg7219FZ
         htbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955556; x=1784560356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiRg8U2AaGqyyMZqfViTPDepcCtkMQ0GgYtugq6N4hU=;
        b=h4aRPpHC/8yetbOnPa7ggWYWfmlRcIk6QFOwP2P+jrTe7Pe4Es9WqW54+U2N/PypbG
         lwsAdC8Na9URWcQnkOPniy5mBMzaIxsmAxdLs/ihYe1tkkzwMwncBM4qlBDBaBMVWNEe
         v0FdpLXh8mew8xuyocRho/q6eZ5RmlguUaiHOiK361OfS4617QPYsWHvyIG+pmc9gjxB
         lDYuEXu5RWgLV+UQ2O/Y6KJcJ2qZpPPQCHyr+ChnSOucm+dSx34egAMb1kDtNBjoWyCH
         gaMohOH6Wz34S9S+A7/wgoIa/mYpf4cQ8isrs5NmoqwZC5Wmz6LddYBk1Cs1L137MuF9
         PXUQ==
X-Gm-Message-State: AOJu0Yz2zWXZ4+e4K2bEAXaUtLz76jxYisbAajawfoltRSh3TlfWzUYQ
	PtmYMJpJpXbCh1XGKcK+yy1+rfDNt/Kg9JY2YTustka5h+mBYp3uSQhgv+RMuqrV8axoG5W5ZIp
	96ChULWdyLbNXQfPMCSZ/ci+hKcVf1Mp/0txZKwFihgpRYDqgNf1EpiNHUNLubicr7eeB
X-Gm-Gg: AfdE7ckVE798Tx4eC3zfIb2UWr0CLth96abfRr56x3a0ewh+ZqQN19mobGx2sFK6XIC
	1fj9J4pCn1jjI2AK4ViKb+mKnT5NdbmOWPq0KXOUX7KkBppU5q41hXm3555Hx/Z7SJKGJAOqwbi
	tBhMQtJjhrHPkrA9VR6SBJcJD6OVyBziAbtWfUM2+kHWKatlXZ0yNbIyIv1t3+2gcHVkMcl2ckO
	EFiP5GwvA8itG1FVueP3XN4gjitQ4ASySuw63eNfCclqV6XDydKvQ96sqEUlWz/qSE0JH9oBLdi
	pyqdGQLUSbIETgLKomZk8ohGIEO4c2rg9ODHntkJJGWx40y4phaSu3dVCRAMl+mSQe07U5DfqaZ
	W6GtkQlk0eOsX7/oMXvR6Xuf3qUpDR3t3dEeIDw==
X-Received: by 2002:a05:6a20:9190:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c110bdfb14mr10507402637.41.1783955556053;
        Mon, 13 Jul 2026 08:12:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:9190:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c110bdfb14mr10507353637.41.1783955555549;
        Mon, 13 Jul 2026 08:12:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9081d5c3sm22031039c88.9.2026.07.13.08.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:12:35 -0700 (PDT)
Date: Mon, 13 Jul 2026 20:42:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its
 reference boards
Message-ID: <20260713151229.r7ypcskcvs752v4j@hu-mojha-hyd.qualcomm.com>
References: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX6P9390WTDCtC
 Ee46H/MU26FVmZDJ4qhkrJuxqyyVoNm10yUfyIk6973KzsLXGGmH6ZYcQ4wRzH8ILNTn8Gam1En
 ipYiuJCCxqaZUccnPqUmOR69TWW9u2tosPy7LwVuAIeYda9cq0z4uRsDywDmjs7fF4SPu4HvP+L
 RYlszyoA360y4tQnD2xSVxMUwfnNErhT0QQOXCtgQ3RzyzfinfhCdTLzQ9GNnB0+WOCuJOGaSqh
 7+J5C78U/IWO3q1CNIw296i1zolW7wAldO8RQlA6CMoU5V+eCop7YIuj+efL5JmCV+1ZYlBoKpR
 6AGJgm0kQSkTGkQGJgGsi88HeJL4Jq4meF7OojLwL3r+/mYAfl1WMu1ph9JefIblmXgGMUfCixs
 gA9cCLbIak2A0gFxhLZ9HqOHyhTqQ4ZmgptloE0lfVOxv94OTOev84KkQfHQOVOACoWNOFCY/F9
 Rv1fBepdVetlorLZuJg==
X-Proofpoint-ORIG-GUID: kOm3QLCvJ8-MVxarFm0Y4YEFtdLND-sq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX4fA2o0FhduRK
 voI14RwjPbKzjWL2OtGb6htzINCLdqV9qJTrHj2zVKafOQAMoACNbBhfTWPs0v5IxH+eqdDbe1H
 8yqMRSvXOxceo9bjYt1gpGf1CugjjBA=
X-Proofpoint-GUID: kOm3QLCvJ8-MVxarFm0Y4YEFtdLND-sq
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a550064 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T-fziwSqmcXJobsc9NIA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-118824-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F24E74CFB6

On Wed, Jun 17, 2026 at 08:46:02PM +0530, Mukesh Ojha wrote:
> Add Hawi SoC and its reference boards to the Qualcomm binding.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com/
>  -  Fixed the position of the Documentation.
>  -  Corrected the commit text.
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 50cc18a6ec5e..e229c0097e6f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -303,6 +303,11 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
>  
> +      - items:
> +          - enum:
> +              - qcom,hawi-mtp
> +          - const: qcom,hawi
> +
>        - items:
>            - enum:
>                - 8dev,jalapeno

Floating this up for pick up..

-Mukesh

> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha

