Return-Path: <linux-arm-msm+bounces-92296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K7tNmneiWkaDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:17:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A110F87A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4321230166FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7FA3783DC;
	Mon,  9 Feb 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhOB7q46";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AeJYzvl7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D953783D7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643047; cv=none; b=QPJ3OjofvyGDMhflKFhz/UoNfbSjEkUmazRlFLjJlaCqx0XXRWoySj+qfd57vAz18cqHeQQbA/6Z890SuXKk11TdbKdMLg2sBOibcYefxanPybqsZVN5FWfIgiTHxyeeXh1XWNIVMwmHcNHYI8cc7e6qgBGSkzyjcrmW9XKzlF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643047; c=relaxed/simple;
	bh=CXyWA0iFgKqMGbzJcUwtG+Lwt6uuIEzkwmNmbdNOWno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLgwdPLEf2fhMVz+TEw00BRCKQTwvmqFj2YlpYSQmeRLNxU8fZYmCmgXmaqlgydRMsQdl6b/sssLQQGDFFMuWmNFtT+FwEZxDiMWd2tzy48LlusMn1Uq8VLpUqebbJYWkW5i0r8YYWp8O7wcVykPnMuBSj9sw9R8iIPc74X15GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhOB7q46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AeJYzvl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619C7hK91461653
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKkK2hy2dALldFLFLtmTEX9h
	hLjh6LMDjf3y9AIOaO0=; b=mhOB7q46jiP9T15Qa0BIVPvmlb/5AVNZTVSqrezu
	3Kg1+cEHEnrr4j5bONFQKQWlHS5kO1iHYTdxMUPnhqCUh/61AthYJ6RTddJsdc6F
	i/spwCfhsjP6AUbdXhjau3g+6R1lGdsdyLaMOPJMRweFxjLS9KmoeQ+z2Qcn9MeR
	IkYFOsE3v2oOoxX3w+YgJQ1qMwJAu3DW8Kf7HjD/VrLImQZe2IBqEAHptuja63zF
	cmaI6fORUADFIgiH1P2/86HZw3EsR9B9yVy28pkXSiU3m8UFIIuURMCgHgrJUKri
	ucdgWXUzoqqg3JwSdbhNllGfQhz7JRjlWVhInB67m/RCNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65bm55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:17:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so1182982985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643045; x=1771247845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKkK2hy2dALldFLFLtmTEX9hhLjh6LMDjf3y9AIOaO0=;
        b=AeJYzvl78lEm93oj7d2B0vP4tKI1jqNbeIjyo5a9MhmG+l74qs+K/xIINJE64fFkha
         xlvL1M1qjLKvs28rUktrMbZ6EXzLECv3S03Zq40a6VuZRw1ct2DDOelSZNIvdp5hrInL
         LMIbfCvwXKqT9G8S298p85FmDFySdDmVXZoFSe2PL2qmrSpQ33Ppu7wqOAWKU1L8SJkJ
         JErNxbSEeiOXcjFGXNXn4uTM3Qi6EW6vuXviCIxFQRnIajEy7K2ZcWMpv3iYKQnPKgUw
         nHYUezZmqi1q5SauEbTh2m4hFlDrL0gIE67rBDWv5YhkNRiUrllSwYslERFPsD1yzILO
         7SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643045; x=1771247845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKkK2hy2dALldFLFLtmTEX9hhLjh6LMDjf3y9AIOaO0=;
        b=i92bVNgRE28oMFnqdLqN1t+52nNVP/QFGXPsYwlRpe70c2GEXAdY9QM/zWN9zYXBxd
         JT+gejiDTuK7H005ihaPP1J5IfV23nwrCeuTIBs8OoQCxvQCGb0PlmGnD0Zb+nsRnWgp
         I3YF0jKyoxf450t+O1t4OEHU2KsHmX9w3V0z2UY6ytsalYhXczmrbfKkOV4cH/WBh5hT
         /3pF/L3inA9OcAsxkyX+iJyQ0aNbPASfWh0YpciyXr42EaTNJCKgcKfwnSTJAKXrOxsZ
         t9JJ3VTtakLL2SVTRnsP/TPaQdIlfLOBTduQ2Qg0g0k07N6fJz+RUTETMS1XQ5UuDwPb
         Eh8A==
X-Forwarded-Encrypted: i=1; AJvYcCVRT3Lgr4HtNt0OiP5oNPO6gOnlOqfgQGc9eS8M2h4DK595Nzqpp2kVdIVLLs4IB0AxnwBYbWhfIhzuQyIq@vger.kernel.org
X-Gm-Message-State: AOJu0YwRqSHlePOn3vI11HtSKOeAd4GDDFbvL75COM/JheQENUDXyItH
	8M5AeOWtz7BDlhyzA71r90seJzGlghrxrtf5sk8Rl/BrjgN6b4ePl1rQGMEXzzJowK9D1ys3LD7
	lrtsTQylnuhjzLmvtAiAThL3l1TndTbFvrdbXUfRUG3YbYxWskzCrR7KMaQzWasJc9QOgoB6XOT
	m7
X-Gm-Gg: AZuq6aIt/DFsAEhZ3H1gLuSfOQ7E4N5oyFbautNBPy0aZaireN0agQnSqjmoSomTof9
	xt5CX4FdzVMFsL6jscFlsep7uVvg39m5Xpx+E9wvB3VggUPxIO2AAABH0mA+a6q9a4+wuTgS2Lr
	8MJZeIbZgbjK0riShj1M4dyiS10HzgivE0iIbNpG0Id0F2KlLrdMi7+uJjQb4Qi9yGr/wapqAx1
	q3lULoxVgJ6xzRJ6JumhcioKCF+hJkFv9ah+KCZ0pWl3lCi9/xqm1OuhXDLA5lcqv1mj7BWaxv6
	kBfPIt+AKn1EfjYtr4W+NExAnW/MkA33X+s83BYQ3sSP90RzlKRze13sYgInY9iKqunroGIhB8v
	3exksqCEZOzUVgUzEgH3V62NsgvP55lpGyqzyUcetQbcMbTM+k6cspiLr2UtjXKLvHHtG8CPAdL
	4r2U5ByFI+k9TmSw/oFmert2Y=
X-Received: by 2002:a05:620a:3912:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8caf086c635mr1442044685a.38.1770643045395;
        Mon, 09 Feb 2026 05:17:25 -0800 (PST)
X-Received: by 2002:a05:620a:3912:b0:8be:88f2:5b15 with SMTP id af79cd13be357-8caf086c635mr1442041285a.38.1770643044917;
        Mon, 09 Feb 2026 05:17:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e25e4bsm2631324e87.88.2026.02.09.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:17:24 -0800 (PST)
Date: Mon, 9 Feb 2026 15:17:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
Message-ID: <3snsmno6rbgzsbjdgrauac7lutetyve45vyl7ttvlljjxckhv5@ibi2opiq5ygc>
References: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=6989de66 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TROzdEh0dhA4UvP_4c8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bWA0v8HAF7N77FfHTcjHCkrS2Qh7TqQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfX7cKWl2Z3P8EI
 k/EYSS2CKOP7wOu6cWaj+SKniZFbcDGk6gl9UKIeuB93e2aiiYJLsqkAd61RdUy70ph+v/qNGqZ
 5piV0qAbmeJx13w0X/XXSpLsn29KWiHjVGWzG1chhl7WOT44XExL53kZNpx9euzK1ozcUw0RVG3
 sLuwRZTqZPjUHfbJTBtJPfAVtweXhuiuVLaJXIaZ4WcQ+5zwQL+rNrZsF1G2nVGDaiakFNcijoz
 jAkz7C63Yuu2pYAxKVVyqVyoPB85qiQk5vHs0ETQbKHBv9YBji6sim0Cpyx3j6HXG+XO44ZuJwH
 q5kAbhgz3AZx+SC6vecxTBANstF/DORwO14jLjH+QfXWiAsVtgbmxBkWTtIFJDI+53DA+F4xYaf
 FPOE7zC7VFcmiyolZ3E49i37m+j1EWV0W0URIpi2FLxjmVk5QZBtbBSG/N0/iyskHix6q8Iz+Te
 //idj1Bk3+w8n9L/m/g==
X-Proofpoint-GUID: bWA0v8HAF7N77FfHTcjHCkrS2Qh7TqQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92296-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D0A110F87A
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:33:44AM +0530, Maulik Shah wrote:
> Wakeup capable GPIOs uses PDC as parent IRQ chip and PDC on qcs615 do not
> support dual edge IRQs. Add missing wakeirq_dual_edge_errata configuration
> to enable workaround for dual edge GPIO IRQs.
> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update commit message to reflect HW do not support dual edge.
> - Link to v1: https://lore.kernel.org/r/20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com
> ---
>  drivers/pinctrl/qcom/pinctrl-qcs615.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

