Return-Path: <linux-arm-msm+bounces-117139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qaIeNimZTGp4mwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:14:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD57717D64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:14:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QXrx9nDz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DkMhRuKY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117139-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117139-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60F17301F9FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC51217F27;
	Tue,  7 Jul 2026 06:10:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E203876C3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:10:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404650; cv=none; b=f33tUOk7aYEsFhEFhL7PI5pIX5AbB7XMtrUdPxcIW13+5oaBQzaO+4fodTRCICuflAtRk7iosfDvUT+Fhdj5smtHpIIlBWeVoa7aK9OosnqoKwaiGqZnRV7rEwo7Go7RggcspJ/IN1/pTj1beaE8xHS2rGl8sRuKA++bP4dxumU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404650; c=relaxed/simple;
	bh=aFJ1UhCzxvcgED6g7D339QLHCZxtht43L7Jiq8v6i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae/lXu1OtJjUOFe7B8Dzjt0OXAO4Csv/O+8RdnMzsJOQCf5EtW0sHHdkd97nP5Uwr7gxcgwbkpz1ji8b3Bw/eAXifS55tSRK5kX6ltZr5ylIlph5LofdsLg49JtSKqfh7QDcsw5MmY/hhupmry8/CAT/IBorP2uWB5hEMA5AUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXrx9nDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkMhRuKY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748h0s2514399
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x0GnpLUCqHMPUSbU33Fj63+j
	1ve44zUEAjqkCUCuqBA=; b=QXrx9nDzXH77Iwur/NPdhfcrpFEtbsyouuKvVmt7
	8emcXKYiXTYs783bF5p81E77gcP4JwlC+AUwCM/w/JKZor+OcY1U32A50s+82XcD
	Kbk1Cq7EfN8lDZ1vs+cBRAKRIB+yKPz/4dGmsF3fPIAMqxl5hf6VnuQipeMNZHFh
	wzIr8jBoXxi+ngYH1QttqgXJACbPkgJFuOKnM6FDxTs8EWjGx0jV0BXYtYQTzbRW
	dOjZFg6MWFQxE6YG8SZbAjVtWceX5NECHg/qDl+qLtCnR8Vxd6XB8DaY3pWV49AI
	odDM02VNiJT3T+UCj4F97S9c5nJ27B3Fob5EXSPUsF6frA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8gfma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:10:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8620ee0971so4552658a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404648; x=1784009448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0GnpLUCqHMPUSbU33Fj63+j1ve44zUEAjqkCUCuqBA=;
        b=DkMhRuKY3gj7i9qzM2GGp3MnELMKaI1uSyBvxlqWTcfMkrYv2Tb8uZaEEQqTu0mvJv
         oLTGJtBdLdjn1IDtKwqXtUvUwyglE16iV8BaG8QO6k85Bh8vtisPHHR7tb8UWHjansT5
         5W2ut9mnS7ocFBxshIjZldR6dWYSWj8TW8tpJ40eHCISGA4IhVMNPeTlTw3SpnkRiI65
         +teCzPWb3InBGnx3NYMlCEMnFB7S6jIuu8sMsSN1+ZFu505MgBwiLcFR3zPgfnM37TeW
         gpDG+AF1WyVAA3iNBE1GEaoLuf5eRK6RVvs5xjeNGGpfe483EamIxgJXBki7iDYZXshr
         1eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404648; x=1784009448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0GnpLUCqHMPUSbU33Fj63+j1ve44zUEAjqkCUCuqBA=;
        b=h2Tf0ivywpf2z79K2B182mIOJgODxWFJD4tvE00qRbLWiJDcEZ1AjZl0jxaRt4gtng
         kFrjL8Crk0+UyBs2EjJ5Uf/Nb5GSIYMNlfKxfqA/UzQVBAv0424wkyCnJG62owZ5llth
         87u1q2Oay3ZZvshMsOVYU7Jxiusa5oj2BX8+NRuTro0EyKU6qOJqZy3h/1vnjVjRJycL
         C49RY1lcl3IzwL7USEAPJ9WkhG7les5kSkXuMM7bsB5Uk98Slm1OzCrxRj1fcQhF9E8J
         FK5Ge3oJ7xvvx7Ry6HvENt9NJ4R/fLTKC6KAX9npmviIIhewfFbLjD6opDqU/51WhdMX
         lFOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9CinoQuyRXZAmHLu+EMM73f+bgpPyMoTbP/vTmiAR6lLopPs90DGSY+XGZaJP0BnFuEuxoHIvvzb4Buj0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ynQGfF0Hy+KSz3hdXnXUAiS3B27TjaZcp4l7Lfr2LW5syDoR
	QYWgI3+tnPKlUC0kFsYNFiF9KdjWLjCz5d0Bv8M9k71WTLXxtVj93f+EJOvH9PsCD67KVYqOFFP
	q1kIJk21LP3xLMY37IiRsaQH2dQ1HYArxgDEwyiWuwfPIs/wREDksWEl12/bdCl/QQCi3
X-Gm-Gg: AfdE7ckvdSVr3UP72y+wUxf7ldKCZlMvIlMmASkLOHK44rjbjKkCLwM93rsq0Cd8JN0
	psAgvd4l7ke/MDuZcntFrI5CODPHeNMaKxduEpC0cw5PYtp8PR4ulxJXZMXjUpUCv+oFRJfmZvF
	JHLBkj2DpuXYwnoilp86WqO3pOxOqcud3MWrR7P0NptllmRIoTdWihEAPJBS+Ym1AkJClYujfsS
	PNiBIs5LwFQeopt7FQmWr4QV9abGA9jWIzQEA9vSDUp8HzlIGxIAHtMcjjl8iRu6saEqJnSDie2
	QenA0l+PkueSCw329MqbG7aIIOCFnp8oZfYZ0whu3ZOBaoZOSgN++oJGDcaoGjSvrBADDMAUQkb
	0pvuvaC60z3Uhj3K8akbSfKI5ALYoauTXfwHqfJHpAIR37tKj+V+xGoq+mGpLfEmbYvSSr9LuaI
	AeQptccTq30ZrQe827dwXzZu5tVqnwpwuhvNo2Nl2i
X-Received: by 2002:a05:6a20:db0a:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c08eed69dfmr4615299637.50.1783404648170;
        Mon, 06 Jul 2026 23:10:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0a:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c08eed69dfmr4615271637.50.1783404647686;
        Mon, 06 Jul 2026 23:10:47 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm5151107eec.26.2026.07.06.23.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:10:47 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:40:39 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Message-ID: <akyYX9XsFTOfuzyQ@hu-varada-blr.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX7FQuNVSV5Z7z
 yjGMkGWJ8jJyH5oObgljxc7aL/pO8jAB9Fhnldw2QtXGTfKHRHnRhy1MxRraYp3qFo7toAvKeXK
 9vu2qitu/pgyLlXqrjlA4StN7gU872/YLSA4O7UNbMXHw40KW/1iVGH7IYLHzamz4ubua8C/Qfl
 vaQDkqBK5GeocWkByoHlX6JlLCpajMgZaKUXVU33fTnvNa2CwX6unYpF5KJY7VJhI89chdOoPzL
 ttVmn+gjvUrcXBjfwAF4EYx96i3sVCNb2j8WY2y7pzdY4vqxyaSzB92MI+xlYQLnxG0H+Cu9cYl
 CntHDzLV7jgBQ6w12xf46+f9935p1FPZvbociFVcVEBvF57U1JcXovY3SYMrNNtkTEe+/29jaTw
 e0lEAEE56/ekt2sHt5JggYeDV0/fPvfJpyL4Ef8W6YgAVP7Yb9Zq1NJnu/KAvWpTEG1LAWHEeQy
 3BvUkKYsXijicbxmzIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfXx2K2nFAqbtsy
 uO7j8Dko3aoIgICeN5h0VbHgkiGy3FhlmiMTM1/hNdrhao+u/GOOvi1Kz4HNY+HEzrGtKt9HaF/
 0nMhfl2b8uwDQRdZz+NYpTm43v6JN3c=
X-Proofpoint-GUID: AW0pPXCw36IGe--6LYqxFuFGfK-sFHww
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4c9868 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IW_28pUNWusqPMEbcmYA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: AW0pPXCw36IGe--6LYqxFuFGfK-sFHww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BD57717D64

Konrad,

[ . . . ]
> > +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> > +			assigned-clock-rates = <20000000>;
>
> Is this clock supposed to be fixed at that rate, regardless of the link
> speed? And is the default rate incorrect?

Yes. The default rate is at xo, so need this.

Have addressed the other comments and posted DTS update patch enabling
multiple devices. Please review [1].

1 - https://lore.kernel.org/linux-arm-msm/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com/

Thanks
Varada

