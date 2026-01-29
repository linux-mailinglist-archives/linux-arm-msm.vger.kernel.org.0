Return-Path: <linux-arm-msm+bounces-91100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKziFgSvemnv9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:51:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F52AA63A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 943023019FE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F362DF3F2;
	Thu, 29 Jan 2026 00:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhizYGFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ev+WyEJO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F72EBBBC
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647872; cv=none; b=ZK4KoJSsQQH6Fec152tk7Ky/4Q8pHpXEgsq52A6E+7UQK5LAQlZ03PnhRyFYADGNau4Xn0qeELHVw3KvkdRRlDUiJ1k+ZP8SvNOeqqHmyxyB7jJcJ1NjyvoCboQrL9DZH07OdTEI0mYGBSjPFlz9icE7+CSf3LvuYakyRvVDzHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647872; c=relaxed/simple;
	bh=XbGhdM5R6kglST7aIewJwl4vmHrrkLI83o4LjzUAOWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJXgXvPXMem383vFwqF12RaegPlsg7XYh2XgegRs2SrNo6m5rfh80cqY6cFZXxoyUL1riifxtfRYbwTWyACA5XSEnHH1KaQinon2A+hJfKWR0qam0eoYgGS30VOsb9z/lWWTK+Kkxl71NImSA0fIuVucAVYB4OwTByyvEAk4NFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhizYGFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev+WyEJO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SHbcQB1750477
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+WZ5p12VkpfX832o5SO9e+P
	vKsqNe/lB/hAlOK3sLU=; b=nhizYGFEF52633CDuU4F8TIdryih2X4NqIejN8db
	TKdy7A8NYkqNhc+Xi5PQxc1HNdOln9lnwsCGcruzVQ0+aSBkhlp70Q5OFHICsuB4
	MTEcbA2Ra3cVw50EckPewbdt/0beA62X/XXBpPjoHYcBty5zEkOdMqgU2GCks9xi
	x3yi3EG0NG00xZwwV5KqabVpDNqT2c2ms6dpHPY6f4Fmfw03abvBoUOz4K3DefJJ
	6kerEiNnk1Uv53ysq09ZZa85w3UeD231qQbITqfeBLl5H3gzpsWzP+lS0DPizhVx
	31+suTnwCsbBugiFlLj9BWIFYdetlurQubsok5wkwseR0w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byhsjag3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:51:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9483db35badso636897241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647866; x=1770252666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
        b=ev+WyEJOZGfLx8/S8IfymMcaj/6GGK3Ip0qeQb2i0VkBUBvmb1HZNgWRBFRHmrNPD2
         qXIrT/WiDAUxfe39r6KLzVp4YExGJ/50l+fZ4mONFr58sJnoVXOcSkjU/qthc4y3/2O2
         g0jVHC8iFY7T/GkK1QE7rXYk12nF+zbaVFkwLfhHkM6IPNhODR/UCwfcr19c0AFQZWhx
         Hr5bZ1Wn8E50Q/PA++06LKRwrIYc9C2+9gxEJvhnLDFtQBzSjXg1Qv8HaPA7+KtbB1o0
         ZN6+kbsfB0vbdNAAvKpCKGf6MSaGbQYO0o8Yytru6P3UTaeDDV7XzYBK6MtwxA8XuEJN
         voFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647866; x=1770252666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
        b=EhIpu/zbmtnQuxcZ5n/7f3gFqdvdfrej7juzDZr+CZ4QichZQt+fR1eZuRRgcIDY/Y
         QWIFWvLc0uUtP6Fz87CYGwjfpiYqHA7KYOem92AXWNUTFEzdHBtSBisHizqEshArNcjn
         1Eajkw5+tgcf7UrJ+eRPAx0yylOB+UwjXJVd3Yf8X59unNpziosnZMIpDAkVYfjQqm0B
         txwKadrdf316GhuGFddDFQnfdqpQytiGk5DUvjTtjOzYDuGEDvo0T5VO5Aeyj9zW1mb7
         xuvaRDITlJ0WJrG2SJuoV5Pa1hTWqHsNainJs5q/mZJLLPqavG7q2YpbbYyNq0MFsTSO
         LzeA==
X-Forwarded-Encrypted: i=1; AJvYcCUufI55QWq3hfBkQrjg3jXLx5Fxd0V4zFdvlPM1cSe4Cq/ukzmPj/iz0T576gV33+TULWDznzl/BXnuW7zp@vger.kernel.org
X-Gm-Message-State: AOJu0YzxOjuLDbO5qfqDYPxPqAYcc2pzz9z/aZpMV9ClONAifnYU9qE0
	Gh1UyLcCIVRyJ0ciAjC/b1XG21gIZ1nW0cgw1dDwe0Dprt9XH89y4zhQJ5OA2suOdOTqDC8rnAI
	Br+dOBLlG7KKNH6vfkFKCrfq2qK1tZQzvTeUl9G/qGFlVuT4Lhl/fCtW5vtBaH0LU91k8aGjdo7
	l3
X-Gm-Gg: AZuq6aKlFGlYy4SX9p+gJoWBwUhDce5QvMrkUYa5MvgA3wgddpDK4TuTTJfkvRGNMZI
	CEhiY18HxRVo1OwEPmEkRBM49DfzBEFzsXSZwhxI4W0Fz/IKCJOb7ZuB/HdDVxGZuZzIaJA6OQ4
	JUeoYHQgDJcFBRXfqNJ+qKX6ooevgzWxWKju/0e0tycWLfRc9TGzNfd98yH1YbQb1n/aqPYYuxo
	tg0tPPNPQD6K1JGb1peMOaW6RZxDYae8Jz5y+JjaSl94/uce0CYb+06LpnxWbJ+7pfEwrXh3O9G
	90mDYQ3WA8noSfNvlcVs20g9Oog4GllIbkHgPsrK0pUnGivF1SDaimWxQLk7KpyPXN6LPGZsRV/
	I/uBSXjIAr0dTXnWJQtbmB+GAorFu0qFqktULXb9Fj/u97931KP2lZwJr3Hdq0T7DKCJjx6GjOM
	l6u+QbgqGOlBgTUWbEmA2b+rU=
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id ada2fe7eead31-5f723631147mr2251781137.17.1769647866473;
        Wed, 28 Jan 2026 16:51:06 -0800 (PST)
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id ada2fe7eead31-5f723631147mr2251767137.17.1769647866075;
        Wed, 28 Jan 2026 16:51:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbf55sm856387e87.90.2026.01.28.16.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:51:04 -0800 (PST)
Date: Thu, 29 Jan 2026 02:51:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix
 for DP
Message-ID: <77qi3wlmjzdios6a6kqifsbsyusohcddz737fmdgmrgxcqlpsb@f2wkl7sw7nci>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
X-Proofpoint-ORIG-GUID: StVxUeZjN_J-BBB6b9ZoSU3a5zu3SZ5k
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=697aaefb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YAN0IDdG5KZRBbBB4vcA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: StVxUeZjN_J-BBB6b9ZoSU3a5zu3SZ5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwNCBTYWx0ZWRfX7drPwXtNtzZZ
 Tubhh34vqLJ+G6wM9M/lupVTMEQm4yEGce0NtggHvQeE1g7gYku5j5lRukHEC18oY4I4keYqPzR
 Rx+/vP34BBUAwqgc/A8/hc5W5de1xx8phAb8SBAaJAyFmLooYazNR2jaJ+6aqt5aQ1ww5LH1K9w
 iXVt0DTE15XKVjpVjD3XhzT/mgyF/oVBzpGTtI8RRRv5A4gFFOaf9T6hTEz3N6Q83mwK6XXELr4
 B3whgJ23GLckEInZABai/bOpZZxmQd0gP7nC1aw10yq8xxQW3kvESBUU51iUUINGlQ6RCYdQaDk
 HigPPbGeEVmwrJAln9XQc4hrvWPtTdTA9Z8gDdzHciyh9Eop3JUmj7Vw6VS9Z1KPviWZs2fPess
 202U3Ox4mlRVNV4M+9Z/jgjhbF5Vnt6kCpy+tBWD05JXd31YKEHfvRo2TTPaiNbAM3JeAZ0IQz/
 cUAxR+XYqiM+HXkXDmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91100-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04F52AA63A
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:57:33AM +0100, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

