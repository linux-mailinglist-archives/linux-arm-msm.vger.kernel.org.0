Return-Path: <linux-arm-msm+bounces-97287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJgrCTtis2lcVgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 02:02:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF427C239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 02:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B4231A9E83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 01:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C49262FC1;
	Fri, 13 Mar 2026 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3ctPEEZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRXsYkZw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8C185B48
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363624; cv=none; b=XjxAbBddujkOObEN7nojsELS8lRZrBrpjE4t8K4VPkr5z86cBWs4khvgLWhtQFGE5vtrnHp6g27OgJ/bMSANmDME1l1gpKBCmWsV82gXqUZZz8jhsB4eQ+Mc8UPXjaKBpuC/J6cty8OmtTj/fXd9eGxGT/4D8lg4dhruwAVnbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363624; c=relaxed/simple;
	bh=FXQfJcR+VBdT6Df4JpN0DbxF0y4BA+diX8kArJlf1/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpDmVc2MPiyjGn9pIhBZn7oLqTsRIcAEPJyd6sgujQfQflkyPfrS0Q0iqxW7dof1vnREaK+Nyas1ZP9UDfcOK8E/Mhnc4tKOzjCMhD5xtV5mdFFwSN+TukFuDa5DuVQogyGRHEuFArvZIBTY2LzBmdJo6IVYyF5MhV27ro0V/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3ctPEEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRXsYkZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CNX1FN1594038
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=umDVeTcpAWbzP3AnJt/b1Qw3
	MTgZdpp50Uw96KR4UKE=; b=j3ctPEEZ2FYcTTo7fqN8LwYXG9Mvg58KFTctyaFz
	goCDA7M80johF/r8lcYtiOrRrdo+SdLNSgdexUdhC1V89FoHsv778AL/CR2HFcgo
	S6ifn4F5uqJ8DBML8lhW/Qn6IPaZ60sJvLu8RCbpSDI+3fxfzueEfKsuUe/iodQy
	CmmQk00ek4mdpb1HQ76wbY4w1OMymzHRnnterk0WThA9gBSpzlcFNTDxSNSL7F5f
	9n87E6IT/aWqqIVX+OOuxuqDpniqCb1fzMUZJErMG2Wvv++a94wRR+s9+9liYB3G
	PTcPf4ZfZc7Dom9gPW/IkQNp7i8y0RtYitjKvbhChqqtkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqbbvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:00:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so891982585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 18:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773363620; x=1773968420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=umDVeTcpAWbzP3AnJt/b1Qw3MTgZdpp50Uw96KR4UKE=;
        b=hRXsYkZw9xOl+ygbNvy4bxRvq3gKToSdUM1CDy0fZilMmmWFmxoVmyJF/KIOdsmClx
         ZgcPCLHKl1KYTJPQCO96E6PfeEBsZxZ4sqL+K8d7RIQcDxuJts17lfB+PdxXfc3p4PA4
         IEYhlMrLY1StHOGw3w7ygk9yyvWYkItr2X2d4SZK9piXWycriEznfNlH7/G7jbu3oqkO
         yAlWxPy41Xf2GYrU8swot0Dh/jMYfGU2joTiRGT65BxlLhxCbBFNRTauAtrTVZy+asCo
         a1Ebu+tLh64Q7QJK3U3MlDdkt2pHutq4CgTdlsvfBOQKiO9WQMUQXZS9ae4vt37GNdmA
         x7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773363620; x=1773968420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umDVeTcpAWbzP3AnJt/b1Qw3MTgZdpp50Uw96KR4UKE=;
        b=rk1B+Iu6whpvCkRioL8depKh5atHnLsWP4Ahpp1pYPvLUyGH//27cZpqqhHhOViAeH
         SJkfaMkmekeRcy8ksHuDc8L8eXYt8PVRpKacYh8TKb6mdn8XXyqMzeE2m8NTbeSDykky
         44RwDHK9x/tkxWorXS9xM6qg2yGiivLsXLfhWIC9cEY8WggoSIxijXCQMVjXJmGnDS01
         OdBL0HrvcJs5/weZMbE9KWT8krgI8Z3YDPXDGxRt3w6eRftjJZAZSgBSl85w4FjuiaEP
         NqflzCGJV96Qm1RqecClyo6s2/6GaAAaZwME1Y0tgu+nGp56QvmSYuDNrliDXmrVfvph
         Vr3w==
X-Forwarded-Encrypted: i=1; AJvYcCWF7kq9iudCmjAQ3/G7Mj9sg1i9vkn0ZVQLR+eOwqYyifDxtqia4joBn4HcO6ZGVUNH0rNnerg7Gd/ZKx19@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYGpnu66s7VH/JBqtSRPT9cfCBcsTBwewy3M1gJULimbEZs81
	wu5rl65dPjXEaEK+jx44JSi11+29YUfEPw2huHpJdEYOcSgxQLr10OBqHa9YLgzHJNjLtQkuok/
	4eAlLgZ04/7+HJOHyU3K6uPXs8BlyzVX9w/DA0fGEW846LJiKIXfeUwrq7gpAkSa9rlew
X-Gm-Gg: ATEYQzwH1mkMOUfkGHY1hd9iJFp8Pi4U2IfGa/ZNqVSQV/a68A4mdSjAetOKFCxFY0b
	ikzv1wiF1w+qn+IIhQ+PA877rO2O/NK6LgR78CtYY5BlgzBZ5K8iKWVssGBgfGeEA2uqaBT4V25
	/HjLy6FZmL+Yejqg9OjQLxNEbrvQqmlEBaSsATcWleGcKt2Ya4sq1VQf96cFS77ELrV92iqV4kp
	9oWFC0TscdRe5AccSdgBR1X1J/lqcB3VuibVeFwACEiE7Sqlba+OIxIOgatbT3zuGSjWx04uo9x
	Dj62ZCdN1OolQWfIwZQ95T+zy2Cf2PuigsZBWKuKsIl85F/dmSQJo+26AOtwjaUevyh6Cf8nKgr
	160T/G6SED4t5aAtdeahtpB6056OBgXcC95yb6nFcBV3bI/rQEZOA3o/K8gM5tdYwQcL+FYwncB
	7NVdcKd4CawFlMO2D/I5Tfz7KFhwSduxTvhUU=
X-Received: by 2002:a05:620a:2954:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cdb5bc5d2cmr232024585a.82.1773363618948;
        Thu, 12 Mar 2026 18:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cdb5bc5d2cmr232015585a.82.1773363618301;
        Thu, 12 Mar 2026 18:00:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6dd87sm11964741fa.35.2026.03.12.18.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 18:00:17 -0700 (PDT)
Date: Fri, 13 Mar 2026 03:00:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <xpgemxotxbybecseyvyuu4v2m2yz2kerwo2tf2xvi7xdda6w7p@ezvoc47pqopt>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
 <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
 <20260311-unique-daft-nightingale-584252@quoll>
 <tpoksnga6erjhoh37vohoqw32fe62wbhjg74tvulgyn4jt2nbi@kamwahlyuqvo>
 <bfcaf538-470f-4766-8ff7-122901872a75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfcaf538-470f-4766-8ff7-122901872a75@kernel.org>
X-Proofpoint-ORIG-GUID: _Nrb61TYUR2rtil3vndZMew0XNGnk-tD
X-Proofpoint-GUID: _Nrb61TYUR2rtil3vndZMew0XNGnk-tD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAwNiBTYWx0ZWRfX8IUVivrGMAEk
 zAchIWdP0OvIXjMcolCldXFhfo9vGrzTFgPLsARY85FjiWUyonjPBCzENatKof2Xk5+gEff2+Tl
 5shrA29JMD9iREY+QxtiDUxe+pfBHr+LJSFIN/bKH8vkslm3fxcHkO4+nKGldRvzn2hltQvfslk
 Zwmon10E8wrC/eU56azNHnwXOz5mI87zwDjc1f3Nau+aav/sj+orpYxFvT1GURoWf2hZagWlE3N
 pNV88+L3sm/M4Cgtokwce4Ko+66/NC9CaRiYugZqDoKqQ9oaSTbs4XcI/BGTTPbL7VP2fr0r2Az
 dtlAyjd1xhZ+WiadqrdM/OpZAOOvh20pdg3hrtdbrejZFF/2g7wpaqauyXGhSpUKvRT3VBzST9D
 obEBfLbfOgmP7Lop5QFuR7LKe6B62ZN4kcYYDNPV3Z+qHDvd2nH/YYKCyaO9jKC6OHIRC/iI3Mw
 orPgwCkhAcE7I98pnkw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b361a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xUKN_BiNDskXMR9hgyUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130006
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97287-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 7AEF427C239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 05:08:46PM +0100, Krzysztof Kozlowski wrote:
> On 12/03/2026 05:53, Dmitry Baryshkov wrote:
> > gn Wed, Mar 11, 2026 at 07:26:38AM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Mar 11, 2026 at 04:04:09AM +0200, Dmitry Baryshkov wrote:
> >>> On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> >>>> Document the component used to boot SoCCP on Kaanapali SoC and add
> >>>> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> >>>> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> >>>>
> >>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>> ---
> >>>>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
> >>>>  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
> >>>>  2 files changed, 159 insertions(+), 1 deletion(-)
> >>>
> >>> With all the changes to pas-common, what is being left in it? Would it
> >>
> >> You need place for definition of properties - smd/glink-edge and
> >> qcom,smem-states. The latter is actually not properly defined in one
> >> place, becuse there are bindings having  it but not refencing
> >> pas-common.
> > 
> > So do we for schemas definig smd-edge.
> > 
> >>
> >> It can also define common order of interrupts, but as you pointed out
> >> this does not work for this new device anymore.
> > 
> > Nor does it work for SocCP smem-states. I think that having such a
> 
> It only does not work in full constraints, but for defining the type it
> works.
> 
> > pas-common overcomplicates existing schema. What about splitting
> > qcom,dsp-common from qcom,pas-common with the latter keeping properties
> > that are common to existing DSP and SoCCP, while the former being used
> > only for DSPs?
> > 
> 
> What would be in the dsp-common then?

All items that got spread to individual DSP schemas:
- single item in smem-states / smem-state-names (and maybe the value of that item)
- 6 standard interrupts with minItems:5
- XO clock

Ideally after this we can split qcom,adsp.yaml into several smaller
schemas de-monstrifying the if-pile.

Anyway, current patchset has another issue, I'll comment in a minute.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

