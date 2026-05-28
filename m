Return-Path: <linux-arm-msm+bounces-110112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMeIM0k2GGqkgwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:34:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C55F21C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 14:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A81830B5F47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA4C3EDABD;
	Thu, 28 May 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIbj/kG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqZ8P85v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3691A3EDAA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971303; cv=none; b=bL6NeKIfcT5QaqsVWDBWzGiOldGfnFRNpZNt7bnHSaXUzcx8MU5kcgOTmueoCOnZ7SvYLvA8DeDMtRuMjTYbbHVizgEuza8U6jdkjJiKkJOsHsg2KLZyZa1bF7jPfIyhdfNdujdE5uL0KSoz60Coz2lCDOTEXIEFcVGxTGw6PO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971303; c=relaxed/simple;
	bh=0m9I34TWmqjqBrQjMDf0uEc5IBCUXBa+7iFjGnQoWRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt42teEhB0wjeIZnSDnN8F/qbEPKE2CZ1oWUqUDB/AyyDiPCy6uplJCaTimFoVaDdyzYajqaaHfoLgws3A1HDAYu8KiIdbg937sb9vwDHtaii8lM0YAePPYF6qASk0hyI5IXpAovnpPKgKpG76ga5hvdC4uWxmbJHXJ2xn/Hkio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIbj/kG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqZ8P85v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vsoh124608
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P7CNWFCkJuE0aXgNOkJJeWzN
	CMG3mZxFBsF+0yJQu3s=; b=ZIbj/kG7oZOM5CmcxnZ8bU4Ddj/pR/DF7NcHtaT0
	qK3zcJdY58PcpRv7v0i1jOvXVCD8Q5W+O+D+5VhiYCzivllTU+yJ9Hfe9mI75o5X
	z6uk6Y45i2pN4cwa7RuulY05+o4aPx+2zjyps4+KTa/o1o8fh78dXBNFQKWhM9We
	g4UD7bgxu7q5/v7r1oejTfPD7jCcZ9TZT5sDdgvFmi/CHO9L5myXWIjDAKaxnLtB
	QfhG3hdqaL+Xa3P/j7foDlXzqouWxzXb+zdDocCU4gKIgxZa/AcSWWP1ztn7PH2G
	+wQIGCGXSGBBFiYBCXTi9qanoTxZcte/l8cR4bUwqDTfgw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ycapac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 12:28:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3041ab826ddso12652765eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779971300; x=1780576100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7CNWFCkJuE0aXgNOkJJeWzNCMG3mZxFBsF+0yJQu3s=;
        b=MqZ8P85vb/ClRQghnX4IkCu4B8tHSTnAmAqTIJy6lAK1I54oQ+qmVfolShEzSa6JE0
         QG9zGb9inbnB289hDLCdxOoXpNXgB5l/JgqwWboeKRpmopjTbW8UK5rf0oSil5Y2xJHK
         2he0/wsFZprxlooJCOIA4YJeGpI/ZHxBuhW8Xp7zCFy4rxzoy4J7/dw5zMXDFXMd5eUF
         FbUMReNQgy639GVwnZmDeoz9meoou2EuIyqOC8qOEUr9JCQvV/V1EKvbb0PsrbZz62EZ
         ChMQ2bKtuZYn57HZqwLBuBBYay7OIWD03iKuEF4XpKXmdv0T2vn5myipsJTiyfqgWC+3
         hlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779971300; x=1780576100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7CNWFCkJuE0aXgNOkJJeWzNCMG3mZxFBsF+0yJQu3s=;
        b=qDoSCYUxflXlliVp7GOjAZ8gyK4MSc+cFCKDLCpT9XKMYHwZSFfmAPjtbY9/qt1Hjb
         X2DGsH+f9WaPEwxDYqIcX8NGzELkL+lnXQuPM9Ok4yO8bPlH5+4l8puR+pu9VlWo6rL3
         PvPDnvPIFZRkIHfOdX3aPyteZ8Gu1tIs43cMwC9fUzJn71RoIXW8CzaFbmTJsHIuZHFF
         kaQ1AxFbJEJzZm5tZlWnZxp77uA7QQehXtQ1YTBGL4/FvrrwPx+o7PljS6p1fgV8Chrh
         C/8dA8BvqMj3ZZPmB+/1N5TU7l4IGspzMIgz2A4/15hl4XUja5KFf4fBWEh3zlHrHX9P
         Q3Yw==
X-Forwarded-Encrypted: i=1; AFNElJ97uFj8+gmv1Rb+muns/XVVCXVkDHK/mqayqbj90qlT2Gl79njj2cIYXl8JUM9aILGWsYnJMTOfMf/LCD27@vger.kernel.org
X-Gm-Message-State: AOJu0YySKQmp0hVI7di/G+nLFScUwU7+gJ4qxt/8M0yLU8RWAUXZRa4s
	V2w0Glwoewq9Z4MEQdjgnRvCGiAvKN9M9H6PBRPVNv+fokycofvBZ6+nOYlneXmHmD3ei6bIBuR
	M9meUzsU+sm4s3/EJFkSKdK+ipist8aN7kBXwTRvRd00Bt/TKC4jIrLCnuct7Q23/+aBC
X-Gm-Gg: Acq92OFnQZsJSaeGGnGSFcmen4IACBgLG2h2yAlTGqfwuZFk1eAhJ7kgkOngnBzTRRH
	+TBHEMWbeAWmeaUSpJ6AkffUEVvyWw+7DIIiW7flZPTBS+fLn1Wng4UUhP0+rPNMlFAa7vNYfYn
	9+QvkZGG6NmxHgklk+fjzMOzfY3dGja7+BEFLIn/qI/0fq84MM0RtbQy7stM44sUts6/UOQPZTZ
	JCCZ0Dw4RMr6dLYuajmnQJ8cTfE1P+uE5/TxOoI8X2UjNOJRuXDqJzrmEvbMwZ+orBXjg27jMht
	teuYvBCaYEw4sGE5aaxxlzy+bmr0w9AW7ESp4gQneZXa6KKOvvBPcvUGL3FEFRDn+fWnOKldLEp
	JOnYNXDMngIFCx6pCSGFIW3ADepUP4SKAf4QXHXw/qMOUBeDG/Mbkoe/dj8BV/8Fu41MYuc82OJ
	/lrQ0=
X-Received: by 2002:a05:7301:5807:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30449096805mr11884141eec.23.1779971300086;
        Thu, 28 May 2026 05:28:20 -0700 (PDT)
X-Received: by 2002:a05:7301:5807:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30449096805mr11884118eec.23.1779971299562;
        Thu, 28 May 2026 05:28:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm14523047eec.26.2026.05.28.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:28:19 -0700 (PDT)
Date: Thu, 28 May 2026 05:28:17 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Message-ID: <ahg04dmgSWPuA4Tk@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
 <20260528-adamant-termite-of-drizzle-0c39de@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-adamant-termite-of-drizzle-0c39de@quoll>
X-Authority-Analysis: v=2.4 cv=VOntWdPX c=1 sm=1 tr=0 ts=6a1834e5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=48uwnw2qJDGHVwkyL2oA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 3SpvNUiReV9egIEdYZuRF4oSFJ0hROJE
X-Proofpoint-ORIG-GUID: 3SpvNUiReV9egIEdYZuRF4oSFJ0hROJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNiBTYWx0ZWRfX8XPSA3iYijGE
 BW4Xt8Mo0nbwkQ0uL0GoIgDJtQ44nyNOYyHQWXg2Ctzls6r8WKlGXUpLlAPDfCheEIwKwRcaWPJ
 EC7vng/YUCvAsC2iyHsVqwGSn9pR5I5a9wAvCRfzRUvDD7DODqFwAsNYapl4illB5j5MN80rKO4
 6oSKoPvDG9WxR/n3hVenT/ZwT11XxUzwruT66FiCP3YWcb1PwpID4jfmT5NvZnlmM5JosLT+w13
 6bzuhEApuqZkIm3TsjYa6aFtyY+Gi4REOhpBGfHsUJ3hYNxLk8F17C2BGEvcYjEw4W2wi54jcK2
 LNJ8lapkx3BF4o9QkcFd2hF/zwgnV/kpBjFS1yu/8LM/0CcHIIHQ33YrCQ8D5tevzxq9BAENp+w
 NwMRAY2yOIoTr8rwRcTzixSzWRooJpNZy22cio/TyKNRO2akieG9PyMdbtf5JwvBPA/c6bRNN+u
 kyZbXxG3+wFGfqfKriw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110112-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 390C55F21C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 09:57:10AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 27, 2026 at 07:29:12PM -0700, Qiang Yu wrote:
> > The QREF block supplies reference clocks to PCIe PHYs and requires
> > dedicated LDO supplies to operate. The digital control interface for
> > QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> > QREF has no dedicated DT node of its own, these supply properties are
> > placed in the TCSR node which acts as the control interface for QREF.
> > 
> > Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
> > Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
> > topology:
> > 
> > Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> > has a single QREF block fed by REFGEN3 only.
> > 
> > Mark the relevant supplies as required per compatible using allOf/if/then
> > conditionals.
> 
> I don't think you implemented my last comments. You need own binding
> file.
>

Thanks. Do you mean qcom,glymur-tcsr and qcom,mahua-tcsr should be moved
out of qcom,sm8550-tcsr.yaml into their own binding file, e.g.
qcom,glymur-tcsr.yaml? Can I use a single file for Glymur and Mahua?

- Qiang Yu
> Best regards,
> Krzysztof
> 

