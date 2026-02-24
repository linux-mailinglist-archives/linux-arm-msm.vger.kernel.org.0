Return-Path: <linux-arm-msm+bounces-93931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBrcNE9enWmxOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:16:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797C1837C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B454304EA93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB951366060;
	Tue, 24 Feb 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckFlqumt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIRMjEtH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E3366075
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771920817; cv=none; b=CtCPW3wPyGxSAZ1d8c3qd66f/zpsbg5krd83QqkYoMeFcRFeLUPhSgdxxaNe0OGHBfLuU17HnPnW/oclOYiLBj16YV6epfQI0wDEutTyHOqwgsyX52Rz+xdDn0jVsV0AeuM51vFD1/jL3RO/qq1WOnElr5iG0tAzLmUPkrdV7pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771920817; c=relaxed/simple;
	bh=dnJvf4AHRkUlhNMLZ2eg5crlpHsSPs8c7y+Cbw+o5Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFMp5CcuD/Mo/wzfkeShfDpI1S4ZmLVgnxAob5tnMm8jIw9/XLsGY6LC7ntw2OG41EQK4IGd2irGQXGU9/F9fR40X0xE8h3f2pG8VGnA3MdUzsk7wmUmm/UXHfur9T/Bm88p2NDIfBpO1wMLgQaL5PQgqdBcugM6LiarZZQJ23M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckFlqumt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIRMjEtH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LRat1753765
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IF6QVggHCs6PPNwxXhP8KgeR
	ygfdN//H52J7Uwm6XoY=; b=ckFlqumtXNIiCOSkS8uVG1U7g0mllbYkb5dYVLiF
	9wcJtCTlDAXMAhLirMab2G591jq3olONBHEAAsFrs61b+ZrgMqxEB7SOGEcjt434
	RJQPhjERNPbD0sY18Q+Lzbu8xoYuM8e1U3iZCJadvRl8FQ1STXZSTl/+DyxMKfGA
	UiZ9t/KEXF02ncudJhg3fWtcS8gKp3MPU9ooL0TZ8eQ9YS46bbt8trQTCZ75FG/a
	ttoj+tSREUHQRj6KRstWjDtq/jiHtigxYyPvNKBeDNNDndh8pDgmIiN51gKOxJvi
	y+d7P7snU82kbPL0gcszml4mg86o8BkcrUE6byMKU9EwOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81bfhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:13:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so5246588185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 00:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771920814; x=1772525614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IF6QVggHCs6PPNwxXhP8KgeRygfdN//H52J7Uwm6XoY=;
        b=FIRMjEtHxW4rGtDhmFspdC8yAfg4pxwXlIE/iUMimQQ/uVOhH/bg0ry/7nROixU8dr
         +Wq2WC8Ggbb11vcpxz8ewTQ7GKjk6ypDo7PhMbgUqBurin3jiaPe//SBVepuVwR1zFXf
         YFBRX7svPPoRsWQwmaft934JPPx6Z6nUse5SgKaBzBw9d8yP078VFxHq60I7C9wp5r16
         LL9S5Xkc/8qpucw9BmBnOkRu7FFqd0IdTVfk9e55dJ4D+bUpVGjj5oHpDBfm4WDNY1eQ
         93bev1k4yCX2srcqP02i/Q/JNjgLSbEOz337EP50YXuueu2pe8tm0bqESvfD90PgLOjN
         wtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920814; x=1772525614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IF6QVggHCs6PPNwxXhP8KgeRygfdN//H52J7Uwm6XoY=;
        b=qQa97L563+bUWcnWwIGv9wxjXPxXC1S44s70dhU6wCDmQPo2RJlX0t1rt2p4VfFQZ1
         zwJNBg4ik0aOYsuPwz/vUNRBHaoyK2KtaK7rsivIMN49OPoksi0smktBdV++RcBBaorD
         tdm/18oc37ENQjgOG7MdiRJmj8Z6bf41j7+u0/7E2gEXRpjIZbkkDmIwQ7SADAJ/rhS+
         5nlvDZyRoIRXqzCnn22uxKtd+kEI0VktCYs1Hfr6C7cJt9PR6ezuc97wIJXw85GTM7i1
         mi1r5/Pq/4t0kuxV29XOgKiFvHK607ekUNjgdr7MkRPxTy7upC5E4Pmb1srnoXy8+/GZ
         gSGg==
X-Forwarded-Encrypted: i=1; AJvYcCVMLGp4GdlvXKRTO4bADrQmzPLf6uK4kcPFmxdpRGGWkMpQMlFe7nsd2I0cBwq9Gxe86ImmTbip6DA6Nnq9@vger.kernel.org
X-Gm-Message-State: AOJu0YycEpuFKm3kzN02fRYNKQHJKymYflzHZcump+OA1DbEgTfnZP9u
	UMzWt8Wnf+dMG/57mvN/NsLQa6yIC76hEdR4mvXqi03kNUjN5DPk8lwPWk6892fOyt26xsftJbX
	Xjc4FTQwZB2VfaZklfjvcxhyCTIPylRfodvoTcSAS7lrmkJ2cA3grZZkYZcfwkffw8l+y
X-Gm-Gg: AZuq6aJcPQ5B8BJEmOBh6TvTDcqkvW/zYVRxjKQAL7UTe8B9HdFpOITX+NQIi9/jsWP
	3KH5jmJGmjo5Wt7Cj6J15rGecNmdtWHo1psF18mXq4CfvvX4zwXM/wz+2sMik7dTLoeU7o2OA0t
	y2mlnmgKaCZAVqvb1GIV6Q/Oo36Zo5mpCNJL74eWvEihtphcKnmsuCpX/44hFLwIlmBRzHwI13I
	k5LEc9DEtAOIPk1KmrIij6bjWlhzaZ/udP2FYAy8YGXfSllbeIrEMHPWwo7W3p/fSravG1Q8rZZ
	bVDrh7XI7k76LkcSTH+aXIHnV81U1XmOrWgPij/uaKSqceuo1MeSDAPzEPFUYHeMXsYpixSWI33
	y6BNImtPPBuAvaXKp8cTgfWBusXu3/u2SBtTy
X-Received: by 2002:a05:620a:4692:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cb8c9e6578mr1419274385a.7.1771920813916;
        Tue, 24 Feb 2026 00:13:33 -0800 (PST)
X-Received: by 2002:a05:620a:4692:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cb8c9e6578mr1419272185a.7.1771920813360;
        Tue, 24 Feb 2026 00:13:33 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f9af5sm299229675e9.12.2026.02.24.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:13:32 -0800 (PST)
Date: Tue, 24 Feb 2026 10:13:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: qcom: document the Eliza
 Global Clock Controller
Message-ID: <mzmszgqnc6k2w2jx2buikhdeafz7wej55uysqgoems3l4l242a@ymezkgbihzhc>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
 <20260223-eliza-clocks-v5-1-dcc66df713c3@oss.qualcomm.com>
 <20260224-transparent-chirpy-eel-dc5354@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-transparent-chirpy-eel-dc5354@quoll>
X-Proofpoint-GUID: gsT8lYVFG-dAwrYQnzpy7CyJej3aYszj
X-Proofpoint-ORIG-GUID: gsT8lYVFG-dAwrYQnzpy7CyJej3aYszj
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d5dae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5UUEK_Q9rJWGvd8qeMMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2OCBTYWx0ZWRfX6wc40XOFQmjO
 nNRTLijAncZwpKbq/cbbpk0yOrvrV97QXgolGod+2NBML4bXSnKJyIKMX05sPQLip9XHXoZgEgD
 zbDXl5+VNXOHAsX4Zc02ZY27zECsdReII2w5OUrYSePW7jSj7jBbs0l5Apk/EkLx/QbymxmRCV2
 CiywIwd0BiLPwC7PwUlqA/WsqLyFIIFJb8/vT7xYY234i4OHjsjf7jkR8aVIgdMGlWhGCNRM8tE
 7nMA0nFOR/xhHgfacJ2CYGVZznkl2yvLWhBilnwRhiYskjM+HbBjMiPOlGynuW+XWZbsasLatGC
 vQa5ibSNrRdssS8adApyNEDlxAMnFfkRW5Fh55Pb3o8FH6eirTEfSotSTE6gWBb41hKhku7vLFX
 JPWmJ6D/wRJlNASfhnWr7XQVzdxRmhYp6SVkA3jFD6ccAS01SuJflPF5EgZozqDqO8MWQpEE/v1
 h8dGZ9LpIjE8lU7p4nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240068
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-93931-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7797C1837C8
X-Rspamd-Action: no action

On 26-02-24 08:04:46, Krzysztof Kozlowski wrote:
> On Mon, Feb 23, 2026 at 02:01:18PM +0200, Abel Vesa wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add bindings documentation for the Global Clock Controller on Qualcomm
> > Eliza SoC. Reuse the Milos bindings schema since the controller resources
> > are exactly the same, even though the controllers are incompatible between
> > them.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
> >  include/dt-bindings/clock/qcom,eliza-gcc.h         | 214 +++++++++++++++++++++
> >  2 files changed, 221 insertions(+), 2 deletions(-)
> 
> b4 trailers.
> 
> https://lore.kernel.org/all/d3dee7f6-987c-4d9e-9097-c08c800921cf@kernel.org/
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Well, IIUC, you sent the R-b tag to v3 after I have already sent the v4.

And then b4 did not pick it up from v3 to v5, for some reason...

Thanks for reviewing it though!

