Return-Path: <linux-arm-msm+bounces-101907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBMOAkkF02kVdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 02:58:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6F3A0ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 02:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7013E30045B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 00:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BA61C695;
	Mon,  6 Apr 2026 00:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oraVGmkq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaVP/PLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE651DF261
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 00:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437126; cv=none; b=Fc/Wre9uGKkAsJdLm3/myeoSAwhmZSVXf5m+cPQ4Bykj1gD/z7xe57LHfDiiCgpDmfAvrVz3ZJkds5phjsm0oDpZdbYUOd8IeDrBWQvjNPMMk/THWdjKCHxtJcN6TkPd+kW1l6MEKA41ta+iybXvS/uHPCq5JkDKax3erUpPA0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437126; c=relaxed/simple;
	bh=U69NL3KlUJycu99EStF2wXR52dcBIx4LneC9N3tjWxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWuypnJLP2cW7HOXPlzMfMoEvstlKdM6nvfUEtPJQ51q5W5YPGGjWQ4pYfQ0eyBTyNEFEDmt0HgpSM4DH0d2ketM+/kNsYx9lgiyyfV2Du7X76tjI8ttjHRHj9fmq6ooGAGs6a1hPnVdUlagZF7FJNu5DT5bPhdvpgy/I4kOPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oraVGmkq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaVP/PLF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635KU3xg345284
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 00:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=plykkzu89dtG38Upzg/y2TNU
	tXJmjdeCCRcfnkKEyGA=; b=oraVGmkqRj/TEC1Zfqb1y2uMv30guNpqZmXRksJd
	sm4aGZbJoiYFVrq/1jnX4OaBsy9yGh3z9bJ0aG6UT+dNKDRC0eoHW9Ip9zplgnrq
	nuO3mSKBwgA47J9fvcwDNPYB5lYxA38Mg8cBTx+s7TpYB6XMulYEGL3TU0woN+WA
	eOI4jYZzrGNjQvlPlmLwbdbQXl2KT3qW27nGWF8wxBrfju93+PHqBO3khGtWwRkm
	jN+jEQUNQme1CfK/M4i/nvzf/CH6KDlwcpe6NqkiNWVmaKpGzYkKPUPQXk8Pi4iv
	3nAGmXByB7dNrEO9HlAtulpdtUEan8BNWf2Pwb9iv20FxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd3d67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 00:58:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so99941281cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 17:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437124; x=1776041924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plykkzu89dtG38Upzg/y2TNUtXJmjdeCCRcfnkKEyGA=;
        b=QaVP/PLF9tZ8rpbjn0eu+LHKzRiI3NJNAbEvC9Wr6ZFSHRtFaLs2HbWA//gksam16p
         TkJPrPBgwjRjTETV6t6jBehaPt5dgpbNE0wbYqui/Zva0xpS15/O89/K7uSN28Xwbobl
         aFYQPji7bKLk1SnZG9gu4vOcCKWLvVpQWre2l35H85nqfVLoRGIL7rjGuOBtiMRCJEV2
         5DWN3ZoahWId33UxCCKrypQwIAOQmud9kXMw+Ii9vAD4bmIvvg52FCrMWZbenm1DQ/yG
         12sqJg7hmclMaQ390k6wgM+5KuNC3SXDfRwpD8sL9Nk3APViQLvlghuxJIKrw7un4YwW
         SPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437124; x=1776041924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plykkzu89dtG38Upzg/y2TNUtXJmjdeCCRcfnkKEyGA=;
        b=UrVpbQth2ux1PKLrJ+Rt+reYdmgCqWw+KmcBCsK+rBWWRS5rdYutk+/X/mKbe6VoGH
         dAu/Uhlo/EVQT7LaOX7SKZVKEfoqGIqWes561+ONmTInVog3kROVQRNR5pjxJBHuvlYr
         7LEdmjmoW1qjaU5UoZdZLk4h0R3kZQ8x9HPE72yYiiRpArtBzJcoQhti+QzlixjPMbuK
         C2ZXbpCvCTa/YdrbzcQtWmpgi8zImM9Pr6LoJxSbTwve8AOGTQsTcJXsWaYjbhCuu1ps
         Uk2IttIdmZTDel5YbOvaShlzdEmuWEywEMB55yMF8NiBc2iNx76NPI7rTQoYMQyj38Zy
         1n2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0IMOVz3C7etx9GilqDybOnYuP837OZohMBJ87QUf0yswey9E8lLQyF9+O55HCwA+h7kDhjjSPYfI1oB+S@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9UY7q3emlrDKUKojdIRvqEj5i0uQ/c9sNqNFgbqQ69F3SwQA
	lV1UX9g1WLXUphmA+pjE8Ej+a3/rgpp/beANQNkolaDRcumXRjCJmhBWMtwzPBpzlsA7N05o0Cn
	uOhiBa5nRrnmzVJ8+cnlRJwI5RwBRrFWnb/Rofqr9Y9dbBrkwVFq6XLDv7kQ2E4638yzR
X-Gm-Gg: AeBDiettB+TMoJzRroFmP6ZUHSN+JM4wSzvqSugFUMjjqleRaWN5E7q6PFzLhzCLJHu
	JOgUJfaEge73OjuAuFxCoW9UZ178lMn2KfQCHOUChQOwZ9eSey9YRQd2SOfDMvHYJTy0Zw7h7K0
	VOA4gav1EMXnWOv0HaGIHTww6wmsf+s3S45tXnF9vKp44E13kGq4mV7KgbOfMOj7TbnCx2rzcxx
	rIKsP1F0aCT5kylUAfnX/G29f8LClQ35ueop75hNPzIjtRL0uyUKMhf+CJUAtBlcdGYlPDt/MSd
	6gdUq/X9gOdxYlkGtNv0BmW9DoFzF4YNsvi0WHFDJbYdBaibi6ZViAweZKY0Z6xxPD/Yq4OQEUx
	dA0iEOmckJhhUr7qNQWriWv2YBU3vWZ9DLoLomPBnrZFsWvAG6UXYn0eSKWg4YwsT11qGKRey1G
	fm+jerseDJyEiccFRNNTKjSEUftqUDvYcGYN0=
X-Received: by 2002:a05:622a:5a0f:b0:50d:8656:3e60 with SMTP id d75a77b69052e-50d865643a3mr60606701cf.50.1775437123913;
        Sun, 05 Apr 2026 17:58:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0f:b0:50d:8656:3e60 with SMTP id d75a77b69052e-50d865643a3mr60606501cf.50.1775437123405;
        Sun, 05 Apr 2026 17:58:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdfe5csm26751851fa.15.2026.04.05.17.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 17:58:41 -0700 (PDT)
Date: Mon, 6 Apr 2026 03:58:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: display/msm: dp-controller: Allow
 DAI on SM8650 and others
Message-ID: <obnn4673iq7xdynuitngag35o7he3ogfegxwx33hnvlzhubjsm@5v3sr6euwrpr>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-2-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-2-34f4024c65dc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uen1Ugs8rWvHbqHdIRkXXATo1Q9NJFOR
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d30544 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ul4Vrl7rK0zFZ15zA1kA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfXz0ZctdYVkpjv
 vELszGkhbMu4VSCbBsyzhaqXeXUJOBdE+zN2kiXtwH16J5FUeEyJhYd05l22bD1z2RqyqKVetEZ
 59aE6PsPfwQx6+lGzWwYZPc5EtHyJVITMjcCZIC0wCb8c+qEhq/nMbuDiEBFSo2lzG8NB3vIfwy
 d8olt6zIY+Ig638op1EVKp/7uXC8qWGJzli3ADuig4p8CHwv0tMKwgzKSSoq+yWg6HuI0toahRr
 //6r3UODt8ulMwgaA56DG/9xR4KTBxyU3HzrBnqPaTYOEcQexzVIhGCZqTdh+Gnq+9nS/mZs8j+
 YV45BgIrXuctv2G/yxFp5rJxawdOKyCDa3J0OWnUJYI7SOt9O5KMl6nNwRGl/w3bKlf/61zQ6iS
 Wz9adtQc0wAKBQqR9XbOyBOYMQtBQSy3oiYOzPqdwFHyIFuvO8RvXZx4NgyVbbg1ZjsY3/6PVWW
 b0pqv8yiJO4HOGEhfFQ==
X-Proofpoint-GUID: uen1Ugs8rWvHbqHdIRkXXATo1Q9NJFOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060007
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101907-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,af54000:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76B6F3A0ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 04:33:58PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort on Qualcomm SoCs like SM8650 and compatible SM8750 supports
> audio and there is already DTS having cells and sound-name-prefix.  The
> "else:" clause for non-EDP and non-aux-bus cases already requires
> '#sound-dai-cells', so it should actually reference the dai-common.yaml
> for other properties, as pointed out by dtbs_check warnings like:
> 
>   sm8650-hdk-display-card-rear-camera-card.dtb:
>     displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add dai-common.yaml reference (Dmitry)
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

