Return-Path: <linux-arm-msm+bounces-94917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLHLJC2IpWmWDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:53:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CBA1D932A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA31A30AB0E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88EA399036;
	Mon,  2 Mar 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyl5rPdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGzGrLKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EAE394483
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455440; cv=none; b=f9HcN8rynZj0nbMrKQCEzTS8f7iwiHafJDNu4bLABcYXAvk7WJJi49eepVTQ51SaNNLxqmbeDm7nnmZk0d4Z8oU7JfRvo85vNThowCnDCggHmw4TCinliFfKakwDP9WoGK4Pte7jop+vUx3x/9vib1gWfp0jfhzJbz+eAUPbxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455440; c=relaxed/simple;
	bh=9iMySLyiJHbFALG3XmJdwXG5VuC9RjPuKs6AVzcy5cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/cfSn1vxi820I6Kx08ozlNixYhPYBq9X2ie4FdSg4mNMo3JencXpu6PPsuOFjW5oOW3MogFqNl+pvfRYfTUaYv7muXwDik3MMPkhIDsGrno7Ut2+APpYVcIR46cWBFJ34laK+D2CTJ/Mo9oPw7KgbWtKIxnResR2l+s5dJZHiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyl5rPdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGzGrLKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228CsTA2964276
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=; b=hyl5rPdt1kXYfqTF
	SwSgpTQIxmwUeiYFvCVJWYPOVTsnXvjFdNohDst3j377YvuPa9hP4K78GUrvIHky
	tdbb+zuLQl5Sfh6LWrcLGA7JKWPOb6gJ3y5XDxrCoEkGJQ+9Ng/QQkyVZJglf1/T
	ElOS0QxAtK0pg/s+XvItcsiAob2stdEh69IHzjucM/tjZ3YIxSGtUitXKuKvOLBp
	wgriNLlwVVi6VDlDA27hqN0zpk5do8DFW7wrL9HDVMuxHpqebYwQZ6Ahs0CAQMJN
	G3Tb5vAQ7iwJ10BzA2k9u9exnSUt8DdYqqkMgE/h/fV/tFcme/1oDeAqMQf4eYNc
	cdLqoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbaucge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:43:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7177d4ab4so473621985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455438; x=1773060238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=;
        b=fGzGrLKmRNrMkPy60iuj+qeVmpVFvIeClg+PrQxNiOP3dXeb91RUiU8P/UFYT/TJKj
         phKqKiR9pOE1tw3f2whCG+gQfhaifK+LmLGDhEU/105YvQD/lzkgiGmwDFYDTNAmBoPr
         zJNfl8Apjy0KBl+HCUSmNqY+t58ddC2Fz4aoqLRJS3Z5PRf0CxUBtVEejVYXHUdtlWOA
         XQKn+4ByBKz5DclfJAHF2B8pgP8co/ZOEIfN3GRzdIVT2Kq6Y2UgJnnyzlVj10+63jM+
         adqM61yx+Lx7kImBayC6hsjEkPY0FziuVO6ZDJO/QdIhUcjCiWvfYRrFd/TSWolHqpNs
         QCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455438; x=1773060238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlqArBldRc1YoMwGDMVGPMxUF1kUIY9lZ/UKqUb15lg=;
        b=UHiIa/0rj1ACdARbv9h0zcoO8pgXe4Ia4Ufa4X9dx2PiUKpGmd6LYFkfDLCdABhca5
         lwa8Glwz6wwN+BBQbg5rtXUoFcbx3clfNFrZ4emM3v6jAYhZqTxJ8qAzyojyZINCtnVt
         7b6U2mWxOOM3XyMjDNOKWr1R7hWUcZb0Qf2UuZGiCONsdUAUrZ2yIrfx80YYELNXmbs1
         Pg35wDt1OpR6/OsEuuMK+5Du7spPRQD3a9Q6K3SB4SYDb17LhkVaG1jj5aMWt9kqop7y
         U5xL/n37EfBEbPQRTG/hz/gI7dwz1O0tErUR77VfjZxbRnHTWf4o4Douwvr0+z1PHbv8
         EYqw==
X-Gm-Message-State: AOJu0YyoKe3IXKeB2kWCmTztKhsHjZrZML7ld78A9YdoM7kwX+u4kHAw
	J1TiguCMcLzagoCyvXT2a4zmvbdLXGeobGvmKjMmfyryxbLPQZrQY907l6/cqVI61RMDZWD+X+j
	rviFaQwjoPVqyiwL2rzq6uzeSH6yquMZiTlb/nyTNozpsyIhTPU2WNgOiUTTLS3rv3Ufm
X-Gm-Gg: ATEYQzzrdjfBWeH+OnFEaiAHDck01syaGGxfhVHMjQaZA/yMOoQ0pzvbiwdNx3BU60O
	2FpjjDM18j0gIUipPO85iOPSDqUlfy+xhi4vUS1gU0ioHicMs44JbM4R37NCNjK1+m0cE5W8aGw
	VL15yY6iDg8+CO5QUQCMhhdODjhBlatrhBcvCpcWu+59nY5+eXAlM49XRxEtJJXo8vaaj7eiRwY
	nA36ajkiRLFHwldI/BeZRFSaRYuc/9gWTxhI2hWvQF7UBncJA7xO9ORAxX+jOakED+FgMw+o8YW
	w7XSPTnB0FwomYpeOzmIoqq6czJSNyjbbELsTPBCgaOGnEHWW59s1kPRNo6ifkbYI28ypnAwOFt
	VkubjuwTKoyuRuGK4Sm08hmdO7tMHna0zv1XDbPRJKf27Huq5DzG3EJJe0AeKKNHm+cru7hEQQt
	DLkck=
X-Received: by 2002:a05:620a:280d:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cbc8f0b52cmr1028836085a.7.1772455437904;
        Mon, 02 Mar 2026 04:43:57 -0800 (PST)
X-Received: by 2002:a05:620a:280d:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8cbc8f0b52cmr1028834185a.7.1772455437476;
        Mon, 02 Mar 2026 04:43:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51843sm484250466b.16.2026.03.02.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:43:56 -0800 (PST)
Message-ID: <224ef96a-92a1-4628-b377-da9fb298445e@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:43:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/dpu: drop VBIF index from the VBIF params
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX0+XX+tH9Mdbv
 O47DQHhh/0lg20OTgQsZ8AtlkugA/ZJiVHlOVNMyQf5nLKNUiKcgy8swK2j+0Xdp/eFAYsqu1Jq
 myd6KMAdUajtu6t+I9x8RE4YGoSjyC60tcjc80yUvlJ/xVo5amYJnS1DjnzbLdVzF5MduxcnM/K
 oKL8tbpY2AeJ7FqrJbzb4cMEUuceA2rVE2v/kceAOvTNVycbPtBDq3+V9HBYHeRZmZMcr2xUp3j
 ZRBusOz2Nj0QVrUz/mayzWRAzRtZcHFq4Ls/QjV9UxXBfgFbT9kxU9PiEu3vifsRaEGrKo51KvV
 oW8a+plKCEHReD8L82tW6K62ubkkwcl4Rk/7m7s0MhV7RiU8hgHcs2BEgTXRGIoHiyg0/+tP7/p
 /LyTVaO5wB/uHtnX/mCECM+FzhudhTSOXRLWH7+fPQzbYjeOkHMzVSft4yLGsnx2lg0dH64SFh9
 ujD3Zw7FGP2HhLpB5ug==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5860e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_hvl8nLCH5BLpogRQO4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: D2pAHWXqvpj9bWrEvmcW55Rh5mmqdX_M
X-Proofpoint-GUID: D2pAHWXqvpj9bWrEvmcW55Rh5mmqdX_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10CBA1D932A
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
> possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
> parameter structures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

