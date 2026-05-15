Return-Path: <linux-arm-msm+bounces-107802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFQzITcCB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F27EE54E546
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4055C31ACFA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AF646AF06;
	Fri, 15 May 2026 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPyz0r+n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0awAifb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABEE37472D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842235; cv=none; b=oUttfK3sY6+vDDw5a2ZiOlqhb+nORrQA65X2ap4lLgBn8ia78d5cVF88ECnLc9nrOQmRfOywMs304IXhWXvEka1dJbUkZu1xamEqnDSd6remhNUfsRG4IvRu4e53STj7pw+UVcIyO08DJ6ZRR3Na/qiPwb8a0fMh4eADpd9s6kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842235; c=relaxed/simple;
	bh=PZqP6N0GHv01oCxxyEcHwIdGM764yAd9JmJx6LzXnC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrvrHzqioXpElcA+XKSEqJLjWaomFBe4RlzRjV8lfbM5OsHBoFCu4eHPhKKEZwUsjtnC3+lunO/HsDo2C5SQ0AyMcDFksJqwXFYywq0exoxO6bdYwNoXBr79Q3FdTm1Gn6OLhZ60ix+InIxX6fPJeYTJcs+xyJ/9aRldvBdR6V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPyz0r+n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0awAifb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F593284020762
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MMeHdJGAoPxBJnSt0nIPV+8E
	rlI4Sfx8ecRBUEHWylI=; b=SPyz0r+nW3IiKDnpPdTPa4bXtTwetQg1r3hIQNGG
	Ayi0oryNOL35dgw+QU9YvoOA8tDGQ1k5QaTWpej2Bj2+foN3zpxsa4OJFoqHM7HY
	OMouaIglQKjbGLFjhFhV8+G3zRCvOwLdD5aVpGU+CmhizdFZ9naqG2XaO7lJSM/q
	Q1CA5Hdxl1igVo+sc28F9rFVK4imWsUT/bvq3hky07ooy3xiHgS9VfgF8Jqm+q3m
	jg29RNplMCo5TmC4AAM8brCQ43M2GyrEusprV/kPp0XQkOt1YsfqMhB+xJoLMuLG
	daQ1dgDz74wZH+qE5P/6sO5Kl4Wh03m0UeVKD6s/WHMQDQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtx1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:50:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so8664559a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842233; x=1779447033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMeHdJGAoPxBJnSt0nIPV+8ErlI4Sfx8ecRBUEHWylI=;
        b=K0awAifbalpEDdwpjOZT/a2udhQHqidVYB91NET9h7MRlsdvf4Fn+aq5zpAsGzNi8p
         J3DiueZSYykJnMbGxXLaJdNyvoZ5rhC8W69DGvqPwJoneZRo5OP9lf1Hv5whufEJYBmJ
         LyK+31rnLsnTs5FLWl6TrMIxcc/CyiziEUVMxHlyldWrCheu5zfWo+qIkOblJC2GhsIL
         qZqtQqpQB47iwS4sqUjnbt+t/ooe/yCL6oUMyrkenGj3Pju2atbtSe4LyncuY5EJ/YbE
         YHA7h25gUJDgS5YejOfTEeIB4k8sQWQU9LC8khDWYRJM6y9ICKovdX/hHaVFQoSILbWQ
         zEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842233; x=1779447033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMeHdJGAoPxBJnSt0nIPV+8ErlI4Sfx8ecRBUEHWylI=;
        b=mRlYYJgPszXccLlRi2USSlLBZAdloQuwjQq8tYbMylkZi8WbMd2/7d178wf7SJvu1Q
         UnBJbKhjSoYATTM+tKaIQNI80hDU2N5HAsalgxDXLCwTNgOdKmjFvgFS+V7mdb8Iqf1o
         1S1B5S8fmugU6HLdPEWuPM2VR6VPWt2KKBUW0dDCKClhrKdjP1vq6Ndwj2KDeAfDnXEv
         Z3R8f2hIawsOtetGcPpnD2ebgi6fOWDQL/ir6WDzqBqQH0wqYbVGyM9D/UnqGppwMNOO
         dfy1XPtk29qN1xmx7uGfVSQU0feFnyIzjVy49OzghOhEi1tB1kOHEnfjV9EuQEjKgl4S
         CV4w==
X-Forwarded-Encrypted: i=1; AFNElJ9EhEofgYwz4q5/D86mXNabg9s8J/Vyi2BesEw6rsdAzWKi80h9YFSwdvswlgMMijPXAHUlfwoqu1IdVkCQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyBru2a49D3Z3+xAH/VpFJy5VvMPlZRMdIoMLTGtskUDv6R11mO
	yJFuxMWgLLrNl+D5GfhWrbtdG3OItwrGHMk2YfMUmp/jGXYJ7ZSjyGTsr7hFcEOY/DkL99jmMNi
	Qj+/TQSEtaiUDp7Rsm5D6MaV/ASN3WzO/ldipJCXwy0PB8H+f4nOG7uaQJ7k95cuolLp1
X-Gm-Gg: Acq92OHse9pGFN5Npb9NceNFgx0YaH+DzO2TgPjCub5/W0HRsEfbms70wOPHH+eHomf
	gpnorVfvd04nzRzyyGNWoO9j9lJKQOv6O3aEsdR8tTIyFq3CEHCvrKM1A3qUN+pCpUhYBHro0Tz
	kG+FfOLQvVWxKC3tNuwvDJu01lcbqnaKga2MRaynKuxdVLcLdbLbWRechCXGqznirGFYrQ8gU+3
	/Taa6WPocQYLN4Z/iR7GUy3hTKH84LYuvXek5QB1Ew0ZjqMG+FOfsEbg/KrWawSYn6j0m3Sem79
	HyXtv5vjEGRbFiRuVZJa8BLQOG04QbO80gFSQSCuSnEidxj1S9ZCMoH0MhSqT41EL7li/kLICyu
	49nktJ2Ii3rSw2BC1/pC24XOvb+YkxPn5bR7Ru8Ad99O0QkJVT6sDkYHbf9R9IBg3JO4Zo4gRbf
	kguNCLl32yqfA/U70C6XitS6ozlAA13j1ZcWjYpVqiBnzE2PxCwAk=
X-Received: by 2002:a17:90b:48cd:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36951b82818mr3581248a91.16.1778842232700;
        Fri, 15 May 2026 03:50:32 -0700 (PDT)
X-Received: by 2002:a17:90b:48cd:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36951b82818mr3581228a91.16.1778842232204;
        Fri, 15 May 2026 03:50:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm576682a91.10.2026.05.15.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:50:31 -0700 (PDT)
Date: Fri, 15 May 2026 16:20:25 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <agb6cSAul9aLbnh9@hu-varada-blr.qualcomm.com>
References: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
 <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
 <20260515-optimistic-hedgehog-of-penetration-b34227@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-optimistic-hedgehog-of-penetration-b34227@quoll>
X-Proofpoint-GUID: 0o3R_hwQFCBpJ3sHm2Xu_KRPOfUqTD6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX850B73g4WJ8/
 lPDKJSvMZnKWou3fLb6I70B6iX9xPLX1aB3AX2acSWyG48P6zPaAzUhmcT9x2ozAxe1v7JwTz3E
 M5XK+bS3wTpnDJv+WgwSwiaYBJ3CE84WUNJNtHXK4LoRWBkrVmpeuw2198mP/C8p4CCMX+QG0bn
 oHb4d7LRMJuVNGbLhrwodxcQ0kmsrQ4Zyaf2LZyfYNpb5KOBTOJdIhXz3rbtLDxREeqkZkim5w3
 IH+h1jLKMeHby1xxeHvEH1cn6qU6iYQAytMCZpwMGWseZ2DVhuTh6moIYEhuYzMbTYfs1q2PIJq
 S71CBqeHjc9mVDplbnIQgJ5/qaOgHvOPh9E03D1NCuURtKzMdJa7TCm+CR/TknTQu0sO1efVecY
 Mt6N+MTM97NUTSlC+I+01/FvCPXDi4QXRyIT2zXEcvl64s8iEjALfncZ4S0pAYCeNiXIqsNyfGA
 G13uHN3Wy8YTi/kQpWA==
X-Proofpoint-ORIG-GUID: 0o3R_hwQFCBpJ3sHm2Xu_KRPOfUqTD6F
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06fa79 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CmgulrJ2bCN2atHQ318A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: F27EE54E546
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107802-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 12:47:00PM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 14, 2026 at 09:28:28AM +0530, Varadarajan Narayanan wrote:
> > Document the PCIe phy on the ipq5210 platform using the ipq9574 bindings
> > as a fallback, since the PCIe phy on the ipq5210 is similar to ipq9574.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> > index f60804687412..1ac31439c20a 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> > @@ -17,6 +17,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - qcom,ipq5210-qmp-gen3x1-pcie-phy
>
> 5210-qmp-gen3x1 here
>
> >            - qcom,ipq6018-qmp-pcie-phy
> >            - qcom,ipq8074-qmp-gen3-pcie-phy
> >            - qcom,ipq8074-qmp-pcie-phy
> > @@ -24,10 +25,12 @@ properties:
> >            - qcom,ipq9574-qmp-gen3x2-pcie-phy
> >        - items:
> >            - enum:
> > +              - qcom,ipq5210-qmp-gen3x1-pcie-phy
>
> and here?
>
> >                - qcom,ipq5424-qmp-gen3x1-pcie-phy
> >            - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
>
> So it is or it is not compatible with 9574?

Sorry. It is compatible with 9574. Will fix this and post a new version.

Thanks
Varada

