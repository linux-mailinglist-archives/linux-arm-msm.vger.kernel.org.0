Return-Path: <linux-arm-msm+bounces-112884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KSztApi9K2qREAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:04:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D76779DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kiggQPRo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PJegqJzl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5465930182B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A580364950;
	Fri, 12 Jun 2026 08:00:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82353644AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:00:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251218; cv=none; b=spE8njDAhpDZ19oITVO/a6+3StY8GO1SbM79VnziiGRG+KbwTL/kOvnwo+sirJzdAa5X0WhQB8UjVYYdVSDIEuQFQCGk/28WXBEMiFyDE6CLPrbgVuo9GJ2+yxE94wPDTqG+z51ur4UjzsYjCi0zwmNGRsAy2nFDb96n4fqzP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251218; c=relaxed/simple;
	bh=tuAIt/R7Yp0sjjeF+vLC886o/XFYgD5cKQeAyjph9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AirXuztHNHYkY+pQrw90sYt9rdNy1dB1A2Q/zH5q+0oTqjZwjqaTLWjJuuNjNXHz2ew/HtUEi/lZh0a0ptQhw89Ftc0dAWirR1BTmEb6Ry5AafDkRWhRsVRKyRw92ClZY4bXUsyLBq4jNFZbTdv76R80BMC0/kNJHAnzGXHIw/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiggQPRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJegqJzl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39R7E2502678
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pCUAy39XvVhYmfJPAmpzk/43
	pUuK99XaLb2hRC0DYLE=; b=kiggQPRoV026e/wndGa3YFp8JUh7kmWlKww9c5oZ
	M14BlwLPrIAelHYIxtc2OAK+CAp/kml35xbmqqxp77PxXiIm8LSPXmw24bwCgc7D
	Ei+D5FbV7zj7aQyUGTwDcnsBLdPkvTBQTTF5wJpADwWSGEPCRu5iyeKkfcaX790M
	hAkZPPYzqMlnOT7eRZzWdMftjYXfCK2cd8m0+bBMsvNawk1ipWARkFegpKm/lWgS
	hlkHCwA1uxahXcNr0IkFaCf6Tll1Hd5EgqYGdCRXBmHt4OUAuZXvgeULZvas7ceF
	kyupmAy/aFuk5wxXsz3j7Ry/28/vQj+a+DCbMlCcyh+oug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd2sbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:00:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51771d41426so13005151cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251214; x=1781856014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pCUAy39XvVhYmfJPAmpzk/43pUuK99XaLb2hRC0DYLE=;
        b=PJegqJzl4V1XwZh+XI3c6hcYxmllYMM/OZFtzAjV3Xh3K3raHCK5o38La/bXV9p/17
         CBeACUL5nLThhE/w0vt0kjoQVGsM3mXSJaUfDZK3FH/sYwdJXIHaBf5zxBTkueMKsET9
         SOZKVfXy6onJ1KMCqEmqsjO4iPFXYiGs5CTMSSg9AA8cHX+5mhvNhtorg8i1L+e20UNM
         cH0JygucW2AdfEja4If9NdBJyTf0N2cJQFKEKw/YIR3guIck118uBxR4ixejfp5tnrD6
         eXbecTCfUxuvppPzBs1zsRcUygetGULqhH3Vlg7Av6ltI3Q7CJlF0hob0/1LwEqk7jaB
         be7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251214; x=1781856014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCUAy39XvVhYmfJPAmpzk/43pUuK99XaLb2hRC0DYLE=;
        b=iFnaEkwM3qCLDA30recyK8BkJbX+V54YnZzXF0p1xMpeqp2BmjcTdzUkgjETRihwAE
         0j7rJR1nKnHeSOaAbCR/J2XccvE0XoLMXfgGQ2OJt8H1uIKYQyu8Jr3/ncNQnSfHwQNC
         J6JO7tJLX8GV16DEgiMr1MIH56ovPB/D9aRrQVEug0mKVfmawsbDR21AXEKi3BTj23Jp
         jj6SCd6Sxxf9MMVv+xwCmd4Sq6LfgUmwE75v8A52tCJHgjUex6i0ldiNcj3mFqU9ASwX
         hGsV2z54aAAS92F+cC71RRgHDckARDaJ/pODvia4Ms/3alSE//B2oxxsYy8pkCq5khwq
         n+zg==
X-Forwarded-Encrypted: i=1; AFNElJ+8ZD2cmYSIMBXmZCPusQc0I0t9zD+UARBgfZhOCLHnXCIuvDdr0BN4qVtQ19gmnmOXv4ieCuuG+HsPBm7N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxha0axCdTxYWuhDBUUXsbEuSJd8qtrwSPq3rh4J5lDu9IjQkqO
	3qxoQaO4aJuP9aX0a1C08d6gY7Q/OuAMHI0gG6dPYAWWf6c9Lsv25XFYnx3CMnv9G6FXYhyI2Kf
	+HcU1nzhN4gWVt8yqtTeeDHjN4IMwqzS2oWon7Za0MAXQOrxOtvomxXDEHAeQyLQCLdNU
X-Gm-Gg: Acq92OFz7h4EAFmknpYxK/lkUB0ahCREkKq37fpo1zASDYAI1n3ioIGV3pvXp7Ar/QR
	ltAapgQq1cma9zIVfnhUrM1AiGLCLACaawAa1Bp1JBGRPnWYHFizJoNaUq0bBspIRhWiR1Uikx0
	B5AHf3r5OXgg9svKrPGOBt0C/ct+pRxzqgOoPMLEoGrZNBUaxW6Zd2o9qEedKiOIpSulF+wq3g0
	ujDYd7J6Rn2rXCfZCveYdu0Ey63dYfgMmXf0u0pK1XDflLVxpGYT1rFfI+bp8pXsf5ftTTwWNZ2
	kl2lK+49C5u6r9dLK1WGMDkG3dzhSCnAeuWRfeStYkOlQIn+GLcZ2Nl6WLWbrXmrKLON2i2od6D
	Osd1DAlJkXSo7Yv6gYLTLn1RkfxoRKUjlASNXTGoqZTft7emIEwLC92j5mCwlnWxdAFuKf02Cml
	cDi2hgdiuxLa7vlHj2WB7G83mEi2qaH9mBJgY=
X-Received: by 2002:a05:622a:488d:b0:517:8711:d466 with SMTP id d75a77b69052e-517fe59b87cmr21874301cf.56.1781251212446;
        Fri, 12 Jun 2026 01:00:12 -0700 (PDT)
X-Received: by 2002:a05:622a:488d:b0:517:8711:d466 with SMTP id d75a77b69052e-517fe59b87cmr21872951cf.56.1781251211630;
        Fri, 12 Jun 2026 01:00:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b3d0bsm322680e87.71.2026.06.12.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:00:10 -0700 (PDT)
Date: Fri, 12 Jun 2026 11:00:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
Message-ID: <5vfu3h66pelbhzyfqnagxg2j6r5mn7jupx3nmewt2zsggfa6sj@ttqr775cybxa>
References: <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
 <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
 <xw7f24rvxhkfntui4jjswyyabb5be4cbkfgh7fico6vlhfvf5b@d4axfyz6gds5>
 <0947e485-4619-43a3-a127-5b887780190b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0947e485-4619-43a3-a127-5b887780190b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SaNUG3MPWZH_hBKUagSDVu_MIxKcgf7O
X-Proofpoint-GUID: SaNUG3MPWZH_hBKUagSDVu_MIxKcgf7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MSBTYWx0ZWRfXzWxDsO9fsqRT
 sYC8KHmKSnVvKe6h4njlj7ERGeMYBGn4eZQmJ284gzgmpcJQQ9NRoBV7Pj6Wa9q5m8ePxRVf9Ja
 p8o/XNlztrS2uRLDgR783RJ2/ISWkp6An+Q4vC7Q6sOQw1qKQgd4v+eb+lEa/g3ppZUrl6OXhHN
 EOfzcb0oGn42O/wsYuqsE54A5LtqKDuYFfEqrjpdUUU7YUImhTZ8XPtUDQLj9+u4GA+1JBckPe5
 qLDpH0oPCevL/JrOeq87uirVqoSEXr4Mch6E1Un+d2LkCl63QJL+jkrZnHqTQtiejxQT27hh9Eb
 eKBXdKCIvQoTRPW75jalzHPsac/9qBaDP6xrvY7r7qONdkKD/3h7AXPuNTXs4XI7LobyKP+HSSb
 44jnUupG7DCtEBKaO41WV5R6wVl4zvh3YieP7BdnBqF9N5hBFm3fTV0mIu8Yz/8oes/8Lu/aUVs
 6doGvqFAjmpqfTZ3Y1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MSBTYWx0ZWRfX7FbHQU/kZWu6
 T8EtDblMjzBZvvHHN65QD20bSGHR7P0blqxLacsPiyY1vZTMfvVE2895uhzGWKN3VEWJpMAi+u5
 WJkbpB4laH9p/4JXU5NyBN7XaooGRQQ=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bbc8f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=nvlhaSRbYAXosuLdH6gA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112884-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,ttqr775cybxa:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,ttqr775cybxa:server fail,vger.kernel.org:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RBL_SEM_FAIL(0.00)[172.105.105.114:server fail];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[vger.kernel.org:query timed out,oss.qualcomm.com:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE6D76779DB

On Wed, Jun 10, 2026 at 03:36:20PM +0200, Konrad Dybcio wrote:
> On 5/17/26 9:16 PM, Dmitry Baryshkov wrote:
> > On Fri, May 15, 2026 at 09:06:21PM +0530, Krishna Kurapati wrote:
> >>
> >>
> >> On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
> >>> On 14/05/2026 08:22, Krishna Kurapati wrote:
> >>>>
> >>>>
> >>>> On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
> >>>>> On 07/05/2026 13:37, Krishna Kurapati wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
> >>>>>>> On 05/05/2026 15:57, Krishna Kurapati wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
> >>>>>>>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
> >>>>>>>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
> >>>>>>>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
> >>>>>>>>>>>>>       1 file changed, 2 insertions(+)
> >>>>>>>>>>>>
> >>>>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>>>>>>>>>
> >>>>>>>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
> >>>>>>>>>>> compatible. If not, explain what is not compatible.
> >>>>>>>>>>>
> >>>>>>>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
> >>>>>>>>>>
> >>>>>>>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
> >>>>>>>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
> >>>>>>>>>>
> >>>>>>>>>> Hence, I didn't use a fallback compatible.
> >>>>>>>>>
> >>>>>>>>> This still explains nothing. How different clock makes interface for SW
> >>>>>>>>> incompatible exactly?
> >>>>>>>>>
> >>>>>>>> So I went by the naming. AUX vs COM_AUX.
> >>>>>>>
> >>>>>>> The naming does not matter. If the clock is called
> >>>>>>> "no_one_expects_spanish_inquisition", does that make software
> >>>>>>> incompatible? Why would the name itself matter?
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
> >>>>>>>> clock-names mentioning "aux" ?
> >>>>>>>
> >>>>>>> I don't know, I asked what is different in software interface.
> >>>>>>>
> >>>>>>
> >>>>>> Hi Krzysztof,
> >>>>>>
> >>>>>>     I checked with the hw team here and found out two things.
> >>>>>>
> >>>>>>     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
> >>>>>> regulators used) is the same as agatti.
> >>>>>>
> >>>>>>     2. I thought we could use qcm2290 as a fallback since the phy register
> >>>>>> init sequence is the same for Talos/Shikra/Agatti. The difference
> >>>>>> between Talos and agatti when checked in the driver was the init load
> >>>>>> settings. I checked with the hw team and they suggested using the init
> >>>>>> load settings which talos was using.
> >>>>>>
> >>>>>>     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
> >>>>>> fallback for Shikra.
> >>>>>
> >>>>> Then I do not understand why you are using qcs615_usb3phy_cfg for
> >>>>> Shikra. You say that the initialization is different, but you use
> >>>>> exactly the same initialization. So in a meaning of compatibility
> >>>>> between hardware for Devicetree they are compatible.
> >>>>>
> >>>> Hi Krzysztof,
> >>>>
> >>>>    There are 3 things:
> >>>>
> >>>> 1. Clocks used:
> >>>> -> Talos supports AUX Clock since it supports DP over USB.
> >>>> -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
> >>>>
> >>>> 2. Phy register Init sequence - same for all 3 targets
> >>>>
> >>>> 3. Regulator init load:
> >>>> -> Different for both Talos and Agatti
> >>>> -> Recommendation is to use Talos regulator load values.
> >>>>
> >>>> SW interface wise, shikra is comaptible with agatti. If we use agatti as
> >>>> fallback, we would end up using the platform data of Agatti where the
> >>>> regulator init load is not suitable for Shikra. Hence not using Agatti
> >>>> as fallback.
> >>>>
> >>>> Coming to driver changes, I used qcs615_cfg because it has required phy
> >>>> register sequence and regulator init load as needed by shikra.
> >>>
> >>> So is it compatible with QCS615? If not, then something is incomplete or
> >>> confusing. The driver uses the same software interface.
> >>>
> >> Sorry for the confusion. The Talos compatible represents the USB/DP PHY with
> >> aux clock input, while Shikra is a USB-only PHY with com_aux input clock, so
> >> the two PHYs are not compatible with each other.
> > 
> > According to the memory map, there is an (unused) DP registers part
> > right after the QMP USB3 PHY. So, sofware-wise it is compatible to
> > Talos. Having the different clock input means different integration of
> > the block rather than the differences in the hardware block.
> > 
> > So, the block should be compatible to qcom,qcs615-qmp-usb3-dp-phy
> 
> It should still carry its own compatible though, to let the driver
> disallow powering up the DP part

Why? The DP part is there, in the PHY, pretty much like it's present on
most of USBC platforms. I assume it can be powered on.  There is no
point in it though as there is no DP controller (nor DP pins).

-- 
With best wishes
Dmitry

