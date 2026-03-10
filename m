Return-Path: <linux-arm-msm+bounces-96622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCoSEJgEsGlAegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:46:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A845B24B83E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87BB331E767A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E90A13AA2D;
	Tue, 10 Mar 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHVsvD7J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jfvx4gPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF83C3BF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142239; cv=none; b=IXV1bDUMl2dvMa2/ZzPZtWVal45xvLUDOcgq+++LoBBqlfx76bULfADJ8sWrz25LyEcMTxFyHL2jEjgIHLrMBjhiL6y1O9xooE61TrJjfPvrg+mimj+Y2yRqqXFH8SHMRREIBThvqWdg3Rs2K+D/FJoWc5/JvihkJc6idXILeQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142239; c=relaxed/simple;
	bh=rxSfCPu15s9VzoYntO5I4c0FGp6C+hu5eCM2/4zVLKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lJjDMA5x9ppdzox3wrq1D6HBRaPmpdqIIh01mwSadVJQl9EwWZZ0Sgo9+0/tjBHVZrkvEkEhIkUsOjOydwp48uS2Y/OrVzwe1aePIq+UUmT0tN0sEXq1NOLgxhxt4e1DX3V3ikx+JjyeVmDGLSnuD57+BO7Uh5CCh4/dZn/zZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHVsvD7J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jfvx4gPB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A91j043587471
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PH0gR2C2JBLuCyw+PmALJ00n0DdupIPY5smGuX3CWIM=; b=EHVsvD7JmhrZveu/
	5b28WrhGbBzqHPgiBYLRmP8NrdAodhfvCXM4Nago7nCO7Xbp75Vvkj3XadVLktPH
	2VzMKV8Z3IdDoBsfeXT/8qJhVPAukNBlmTYeteuCMczl8xvX2a/ThQT8W9SI/8ir
	NoPygLXu8W8Q5c037VaOUFFBikFDrFQW6RyqkC8MkIkshVW9/8L/KpMeHB6XhnPo
	gRI/syJ4YYymbOiqjLFWOHp3UkO/dDoi1ceUBqQkLn4wlR648i/8XQ6wuztwjd5Z
	cTeXIevKg5g0ZKRFHsBc+xy2/Cy3XjxkA71jnPik5C55UCw8Xie2UUX6e8fcJZJe
	olRAdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekun6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:30:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50908a43a79so2828721cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142236; x=1773747036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PH0gR2C2JBLuCyw+PmALJ00n0DdupIPY5smGuX3CWIM=;
        b=Jfvx4gPBYVAMPpA++jMlGzZJgGpilWewN1hUrR8BpZ/VHWM9EbaFP8Pvk2iMKuqNtD
         0m9vlWaXFzA/jUJ8nC2LyQsZzqL6tsOYibkPV0kDYz4FQIfs66435hdOCos93RQd2eUp
         N40MmLnasDON6F9CyuhiRe/6R09dJftY7qOD2ve6KF7kx4neYsnEfNaj3ZLjaeyQ+Kns
         HTshs1267xVzxz/pbgkCFJOIRXF3hiSj1EKBeWrWE/uUOE3kXB0skXb3QcSTxr+p8WJx
         FqzPlKApvLk5LitqxZP6dvbIzvC2kAF9oRsrybpEco+Q6l8CV/G6OMtYoWnWJiA5Byii
         gT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142236; x=1773747036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PH0gR2C2JBLuCyw+PmALJ00n0DdupIPY5smGuX3CWIM=;
        b=t2UdGfjVEBC9lKixm4WkQcxQ0GeJ/uabX3paukEnTcFXIUMf5dgl0JdXl68gRSCqjB
         2BZ9noFtKFtU4BSoQ4S7SPssFVMUzve9J4MezxapGCHzZEPn2vbVzEFF6zwIJPgSzsQF
         FZKHdfUGRQoRUBn9Rcz9EvFX0VxKsVrEai1nO332pY9W3YQ/v+vciwRF2F9YLbhJOeCR
         Dp0XcwVnb/eAcGhfvuFc6ZsqRwg5/NytFbjVKM+/RBbnAtkbNcpnbZdoEM1VD1HshaXc
         3i3fe/2mxrB4QiKp6uj+jtJn/1JNlpVR9cJUkuzddig8FgtvV+Hewm7MO/JeRbwK1UDn
         mndg==
X-Forwarded-Encrypted: i=1; AJvYcCXBaiG7D4DWHmuNJtTieMg8E39ecSZCYq1TtuQdm23UcAsDqtCAdyQ+SzJe4D/8pD1waY7iAOVHjjY5FQON@vger.kernel.org
X-Gm-Message-State: AOJu0YxhXOPUel1wN/MqlIgufRig342j8ZducKjEv8YhNHXb/8BKhrki
	Er/pN1zJCVXrcNajgkqM71fShvqNwJLnWZe12hTO55HTtImuqFu54nacUKc/suXy5LZqDA4GHXv
	5GdRCKoe/YT9t0POTA5aydttcAEyZ7EMt3q+okbAYXcqsHa+shHD7TkGuxWo1BdOG/hvn
X-Gm-Gg: ATEYQzw42lmOBk7vTTyBuATyBnJph7xhzUi/bO3iNrODWIyvmH1MJ6iufzUEacf+A2l
	tMQc6os0GryR5lWdUIyT4OJ9U0we7e5VnRcNXJkcntwtszed5n+aqnVCklB+Hku/T/u6hBAO+dx
	djqBSzuQSngX/ka5zK6liM6er+L4bpGc0z00ONokIzROUcnCURo6Cshd36WtNdjzgf8crQM0YTn
	Wx0qGZr4Lp+KuF2bK4UQRC++Gk9VNMpyVkrbepe6j60wNo/e6CqJZwLYYILOtKfxh2V/XX+TBJ/
	xPNF0TWCs+xfvWFsRAGQxjWTmtQStlGC5Gsc+XyWJ0sMWOYCwfX8cZGq0wU+0MIsIDs0vPRNW9f
	7cvH6DEF/iFDS4QOUUKBJBaCxMjs2fNG6Gt0IJuiWI2LR3lCPRwmFqnpInTfhYAznUI+wmJrtLv
	KvcTQ=
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr441523785a.7.1773142236124;
        Tue, 10 Mar 2026 04:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr441517985a.7.1773142235620;
        Tue, 10 Mar 2026 04:30:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef42ac6sm475964566b.11.2026.03.10.04.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:30:34 -0700 (PDT)
Message-ID: <3ecea1c4-cc2c-4a58-b62d-fbba2927fa54@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:30:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] pinctrl: qcom: add sdm670 lpi tlmm
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-4-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310012446.32226-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aX0cZZgiaKFCXKogMdzi-HH9aSk1OqdO
X-Proofpoint-ORIG-GUID: aX0cZZgiaKFCXKogMdzi-HH9aSk1OqdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OSBTYWx0ZWRfX/hgsszhwve3j
 8uUYpsve+QwElnhNjxQAi/B2QmhYL5atTDnNzys+cg9hJRvqSk8l4kg5dp/HsljJiGYxyD96wgl
 2lsIKNQAvUPZjildnZMVissfLq9E37jqbuqfsJuNXrBaGFbESgmL2j/GSYdu5Lh532qE+DAZCee
 63+f2AKC1aY3NlnfpiNR0ctG3wFnpeWTcj+qJ9xJppTku2HlTuVfvWc6aJzR+Nt1nz4nieydOnb
 +sSWyN8I3CyfJa8vbpccCp4oWPJzkjPcUF+5uaeAwAuItqG0pn50e07vvwUadO6gvtjrsmDyhei
 a9/ZUc1lpsChZqQgzNHeaMSHdfPHfVPLM1Skddow6Ng37Y3f+n1yqfmw+H5f1Fp6Yqj/Le8OlFq
 ywHHB/AmyDevpDDyMgl3hQCeoLr0qBu/fCIkHVQ2Kmu3FLN3f/fOVLBf5KS/3Apcxh0XJN2oaSz
 ok7ATHFN2VDl+Tu7nsQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b000dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LBwg1sn3Q0AahYvMUeQA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100099
X-Rspamd-Queue-Id: A845B24B83E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96622-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 2:24 AM, Richard Acayan wrote:
> The Snapdragon 670 has an Low-Power Island (LPI) TLMM for configuring
> pins related to audio. Add the driver for this.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

