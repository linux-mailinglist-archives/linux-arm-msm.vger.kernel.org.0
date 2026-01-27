Return-Path: <linux-arm-msm+bounces-90735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AhbLtukeGmGrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:43:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CC93C50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D557F302D958
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6448A349B16;
	Tue, 27 Jan 2026 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gily/Gxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dqr56VVJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB452ED846
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514082; cv=none; b=WAlUdblL1HUZCe9Y3ST5MiyRkXtCjsxt3BM+S7DpzEhS545BaAzo+DJ3lXXQAZHDKpJRrij+hnsgNBB5ledAE5fypxfZy03aUDpfpCkXWwfPYFl8njts5SoHuzP8XHXkrgACx0OJdJV2KkNFExe7/gzH+UtRtzo8/hl0t9vM91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514082; c=relaxed/simple;
	bh=i+IpGhnnMVn50Yk37FT4r8ukxy5UUikxDIMDg304h0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOVKJ9ZZvAevQSldOCi167z30wNMPZWnAJWoTqkp0riIS0bjtJvte5zTCUmYP1PhY2qjV+Kv9ZVK3VFRJjXWZXhdXDbTyr5SdkjWMuq4tJFfEX+Fvfgx+V4AHXrkGpeglWzK/1bzYfIbi1n7vyYjp+YAQwtNUxAmzX/XFXY1qo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gily/Gxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dqr56VVJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAjgrI700207
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4mzErjaZjKsSBO5rivgnxc1f
	WTPgTKQ7g46MzCj6fb8=; b=gily/GxiBx6uXJF+LFDGBufN9jHLFSJGZAaNcli8
	4rAUjwoCYh9GJINR8gtNskHn81V8/QcQJ0wbe2+AyWp9t9eSpWD4flU4GWH6xLb+
	vxbjMeRVhjrJB7xmhMsW3Tli1V+ARxa2NKeCSCg3xrI04ZtgoBnikKODPjNOYbPm
	zCbz1aqcOPtI7iZ+HOVUj/zH23SIZEgaXrXYz8rbnveQpH83iWvY1n3OC3KSpq92
	50FHP0YR3/LSHcSnZi4wN+8BH4Zb5E0T2lqfYEQo8ri++EsXTSukc9HxVQWuk0PE
	kARdbu2ZeXPeBVi0Hu/AIVqRKdrjNZFSb15SqRWpDfjB8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3tm2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:41:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ba026720eeso1810019685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514078; x=1770118878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mzErjaZjKsSBO5rivgnxc1fWTPgTKQ7g46MzCj6fb8=;
        b=Dqr56VVJukqeLOwgqfUe1cRIJAcbHwxh/wgrsMnrcXDo72khQkRSypeSFq9oXM9PV1
         iRcZ9IZoAUjEs6c8pv0GxFWtWgNMv4M/pG8ZqMOgb41kZdJ6jbdL8FpVftbYg1xZ7qok
         VyOtUvdwskH//WyfmNMLPEZP6xC8GJ+6i7PZTxcakXIRZT8NfRagTN39WNwB64An461x
         xHvnax1Ql811u3w4/pVkyj6zr7LdC1gmnTeSNN5mcvH4GObfyptxUu3dr4VD+i4De3vE
         p5IfARJ77MxCB9PC+4/iXH76/AZu5GpaRqFs4sf1uLaEm9NdfC7xchxyNQVrQrwvQd/S
         1wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514078; x=1770118878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mzErjaZjKsSBO5rivgnxc1fWTPgTKQ7g46MzCj6fb8=;
        b=NA9sAfBpivSzK+GbewYdy/eIQ1j1acvGiSeovDbrZ+ky00Du/aH0C23+wLchhs8En1
         5VxnBtsqYoQevHE0aIRtN+agx6oNxAqqp+yx1J8j4TKSWeNi6ex9cg66kKcOIFVbuAaK
         5FnnyoFBNBrRuJL6qSZtwOmOW6mQfiZKGocXu8dtoA+kpzcVquXBwaFaVwbPIVktkkbR
         mETkGdJpzqLVwjSSIASrsZZx8TTIg1hXOQk0F92pdflrxhi03bJE/luc0SpovsFov4v9
         zY5v/ALR10qFI2NZR8UFo4mQ5EM2OCaop9HAbWLTR8fGJO3A6g6fSLL1UnSpBs1aDGXl
         rKHg==
X-Forwarded-Encrypted: i=1; AJvYcCUrUvpIzgNs8TZuLQWzMhPxMISumWUH7vc0gO4x7Gfqg9m5KKI/mIA504ZB40UXs28rvEWbjvHndc0+CQKx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xAiOn+y020xfGFXenE/bd+bGP2hRVKj7VqTfsvkDY/eQ7mS4
	GAdDBwn0n+lBvKAXL1b6f3Q0hx8uDr8Xzrp9Wiuo7Em+4lrrZr7YFUTFAeGjev12QbyHwSwsEul
	FNyrFgaLvd1RtGeO+gaSN5Ket4IiSB45mpceJe+/XAqsqpo5HSzQGqlDBkqN6lVdnG+yo
X-Gm-Gg: AZuq6aJ1HNEp/tc/5EbJsghio/09LVNN0+hHK0JH7MEp4abAhCG2vPItl7G2OLjpxdh
	U9FN+Epc7uY9Y7GAoXYvQR91GhNHSJnXylblZGt8FBDO2Xqru6Ehg5ju36nTSE7IxoqddQhmVVQ
	+hYZK4tIFfJXPQwVMMNeg8drpJy0h8XrHe2PZ1NqGKPjREXzg44PVBHrm6DJ26OgFGjas8Ys6w3
	VeZsfVJhWOXrnxi7aYs6ODtx9mM3PjfCe+/RArTd+Niwg3RibGuo5kDadng7t4XpF3GtiXrnZo0
	D/vu2qkjd9hi9NuDUNmvq74iQ+P+RrCU+0J5oWcUPlE3Wm1mC2ppiXT6oKcHYbXB2PjY3Butb61
	8nWUzuzYNOnLnFljXWy+7rvC3
X-Received: by 2002:a05:620a:284d:b0:8c5:37ad:160e with SMTP id af79cd13be357-8c70b919dccmr150586385a.89.1769514077777;
        Tue, 27 Jan 2026 03:41:17 -0800 (PST)
X-Received: by 2002:a05:620a:284d:b0:8c5:37ad:160e with SMTP id af79cd13be357-8c70b919dccmr150582985a.89.1769514077098;
        Tue, 27 Jan 2026 03:41:17 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm87128865e9.5.2026.01.27.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:41:16 -0800 (PST)
Date: Tue, 27 Jan 2026 13:41:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: f-LmWTIKJfT2J-iaxLxWlqG54u3_f_ic
X-Proofpoint-GUID: f-LmWTIKJfT2J-iaxLxWlqG54u3_f_ic
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978a45e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MOwG-Syh1sNcuLoOUM4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NSBTYWx0ZWRfX7WmKeIYXB1T8
 u8W5MDHj/BPTD/IgWtXfmSrGUjx6ir9JUbvOjMwSk+PbgakfvWHbW5eUdGSMUynUl8LIG3wJXGT
 PhqZkaUjchVvHPUw+zZ+CCarEXisW9l4pvXpWUO7ran9MuG5LQu5l7/zxlaLiTZiba5jFOpfp3F
 oH1gutH22XZvJ6OBHLcLeaWMh2cBwib6bpYmiOPE6e9zakjxlfAiyYBeFA1zDsPeLSu7c3P3imn
 auXRS63HaNogrhzqPFLwlG2ZULSFnX9c/GmqrHvx7I4n/yDOiG6CdvyKD3xwRbvYccynY1tOmNr
 HhzUXOP5OVdnWuvjeHHrh8KKDFedLvmrDlw3wQxruWCcP7ZVswSB4S1mDkHkJWshqZ1aE1XmNaY
 1he/O3CGzaiBd4MS6+7ltMUBHFXvGETVIAt+JuOHlI7gR2PiVZUlnkhIg5oOvc7luhlImpgCupj
 sosTpl14zDjuI+z3onQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90735-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F5CC93C50
X-Rspamd-Action: no action

On 26-01-13 14:13:32, Konrad Dybcio wrote:
> On 1/13/26 1:33 PM, Abel Vesa wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > 
> > The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> > controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> > PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> > DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> > 
> > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +			snps,dis_u2_susphy_quirk;
> > +			snps,dis_enblslpm_quirk;
> > +			snps,dis_u3_susphy_quirk;
> > +			snps,usb2-lpm-disable;
> 
> Other SoCs have a list that's much longer, please consult Wesley if
> this list is enough

Checked with Wesley. He confirmed that this trimmed list is fine.
He said he dropped the rest since they are related to the power saving
features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.

> 
> Konrad

