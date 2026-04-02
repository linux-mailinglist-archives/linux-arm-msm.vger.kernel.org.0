Return-Path: <linux-arm-msm+bounces-101584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +INqGSTtzmn/rwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:26:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B882938EC7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444233019900
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 22:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB09E3B95E9;
	Thu,  2 Apr 2026 22:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VI+slcoN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GavwrekC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDFF35F600
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168801; cv=none; b=bMYhyahzyEQq7g8lceN7n6jqcJGXs1SoCGE1nMUUwAX3b+P+i7gcfwSCYAGNDoHvGj+L/z2ihRzxkrYALji2iPcCtrMH7oomX46UAAY0izOrfB2G54j67r5/xaTZux99ZgSNP4y+YE6Y+YmP/52G7s+3xbbC4/0gFYLMjVpJYh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168801; c=relaxed/simple;
	bh=xuE0nbuz89YhSuXlJsIeCkEvDlvpiZVgguLnPv51tXM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=N3sJoaQ5GAbk+hYYQ5vR4RsPaCdfb3V7l7bx4zj4Pyyqd0xcZ/qg+gnpp3ZazJdxPNAruyzbTBo6w+n4bzkOEysOMoALmjY98dTxmYl3Tk0GE6bZ/hsycwoh7TzPP3UCs3dFPxTUVIXwpdeYho3WTkerXXuDtJh4pdLe/vtWKv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VI+slcoN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GavwrekC; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 974AE1D0012D;
	Thu,  2 Apr 2026 18:26:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 18:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775168798;
	 x=1775255198; bh=Tajybt9McjsIcQXBo1ozRuz16LHJC8kH16yiXVs6C0E=; b=
	VI+slcoN7pzNne4wM7xeTwwoN0SnqEnAnmbZ8dDbdAWchFMScTj2xHljb+e7+gb7
	vxiq74bkl1+9vdtMcrcN5DKLr9aJ6yyIbMMsQdLC2pTpglzwSki757+/YX2bRqyI
	swIrlMC/Ait8zMQEflE6vQlQyEpAPs+zqCd0Xu2L3puMCKKiZVEWgvBjGAvKoXWF
	JoBqnEUWxqi1jH1fRjNbwgG6sQwtOgW+Hw/FPgBJIpz5uQlkH3Wkepwep/t1MhA1
	ZuLPo0EYYOWheTe3FZrSk2IejCCQ8FAO7be9KDmAWpXSZDeMnOs6yQ+/LnTX5uHg
	GPhCM4NlsHxSN/KZrEs8kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775168798; x=
	1775255198; bh=Tajybt9McjsIcQXBo1ozRuz16LHJC8kH16yiXVs6C0E=; b=G
	avwrekCZMznmVq+MMhkYrttl7itKRO0jcfnRyUkRQzFu5vfQ2+JVO7hSPsHXAcEy
	SBHC7h2xUrmHCXIGSLVszlpSIXRNf3nQmjQN3LmFPyj+u2vrIZHuEhHeon68VLbt
	pALlD/TeQYFFaR9fyAwnh/Qa2HFvBnelP4Ysz8+2gZ4UyDPJER+yCjVNny+fFjFp
	P/nADN+Rwmeg1xhAFVpfwhYmp0nsNmGK9njIhrH6DkPKNpo76k8KD1dJxYsuyMx6
	BD7BSUQC9tpiCtg19DLmABmPcyKxbb9Ghi9ns0pbmE3ALFknv4S4b36oza3G41Kw
	M+787mFYqgNoXa8U+NcqA==
X-ME-Sender: <xms:He3OadZQCZujdqyVppWRF5G3Ee39s_3CJcnHj1MocmM1mNZL90yQVA>
    <xme:He3OafOCblbWlcImG1WtNe56xWl5Cnp7q1QvzqyhzKleBwnJVFeGfG6sFrcNqrCG9
    Iv5_syDiy1PRRJ5stYeQOPK4fXQ3LpCdU5Ye8oab9-PJxfwoomTqds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhrrgguvggvphdrph
    hrrghgrghllhgrphgrthhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthho
    pehprhgrghhnvghshhdrphgrphgrnhhihigrsehoshhsrdhquhgrlhgtohhmmhdrtghomh
    dprhgtphhtthhopehprhgrshgrugdrkhhumhhprghtlhgrsehoshhsrdhquhgrlhgtohhm
    mhdrtghomhdprhgtphhtthhopehsrghrthhhrghkrdhgrghrghesohhsshdrqhhurghltg
    homhhmrdgtohhmpdhrtghpthhtohepshhisghirdhsrghnkhgrrhesohhsshdrqhhurghl
    tghomhhmrdgtohhmpdhrtghpthhtohepshhrihhnihhvrghsrdhkrghnuggrghgrthhlrg
    esohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepshhushhhrhhuthdrthhr
    ihhvvgguihesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepshifrghtih
    drrghgrghrfigrlhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepthgr
    nhhihigrrdgurghssehoshhsrdhquhgrlhgtohhmmhdrtghomh
X-ME-Proxy: <xmx:He3OacaWKm6dBVhZWlISfnGXGWuzduZpDpzWmXhTANZUl7VpGkwOqA>
    <xmx:He3OaS3IUagY5eRQ3yyzwBRL1_6JxtzWVWQhKHpfDorgsDn1TJbn7g>
    <xmx:He3Oaag-v4SohfGiNuy52oKebLG1hDFmOMBC_SpQ_3bNearIJDWwpg>
    <xmx:He3Oafq8n531VhOKwpgEliGgtm4RrDct8MkJsqICy4mQ6MgO1Ivw2w>
    <xmx:Hu3OaWx-I2QxUBWAqc1CR11mM-Ra1ujURUrNoGoWoMw3ugFXupL_JFFb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4CD50700065; Thu,  2 Apr 2026 18:26:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0iuDSTykP6k
Date: Fri, 03 Apr 2026 00:26:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Luca Weiss" <luca.weiss@fairphone.com>,
 "Abel Vesa" <abel.vesa@oss.qualcomm.com>,
 "Swati Agarwal" <swati.agarwal@oss.qualcomm.com>,
 "Val Packett" <val@packett.cool>,
 "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>,
 "Biswapriyo Nath" <nathbappai@gmail.com>,
 "David Heidelberg" <david@ixit.cz>,
 "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>,
 "Md Sadre Alam" <quic_mdalam@quicinc.com>,
 "Nihal Kumar Gupta" <quic_nihalkum@quicinc.com>,
 "Taniya Das" <taniya.das@oss.qualcomm.com>,
 "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>,
 "Yijie Yang" <yijie.yang@oss.qualcomm.com>,
 "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>,
 "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>,
 "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>,
 "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Pankaj Patil" <pankaj.patil@oss.qualcomm.com>,
 "Paul Adam" <adamp@posteo.de>,
 "Pradeep P V K" <pradeep.pragallapati@oss.qualcomm.com>,
 "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>,
 "Roger Shimizu" <rosh@debian.org>,
 "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 "Tobias Heider" <tobias.heider@canonical.com>,
 "Xilin Wu" <wuxilin123@gmail.com>, "Abel Vesa" <abelvesa@kernel.org>,
 "Ayushi Makhija" <quic_amakhija@quicinc.com>,
 "Canfeng Zhuang" <canfeng.zhuang@oss.qualcomm.com>,
 "Erikas Bitovtas" <xerikasxx@gmail.com>,
 "Jie Gan" <jie.gan@oss.qualcomm.com>,
 "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>,
 "Odelu Kukatla" <odelu.kukatla@oss.qualcomm.com>,
 "Petr Hodina" <petr.hodina@protonmail.com>,
 "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>,
 "Raymond Hackley" <raymondhackley@protonmail.com>,
 "Sarthak Garg" <sarthak.garg@oss.qualcomm.com>,
 "Sibi Sankar" <sibi.sankar@oss.qualcomm.com>,
 "Sushrut Shree Trivedi" <sushrut.trivedi@oss.qualcomm.com>,
 "Umang Chheda" <umang.chheda@oss.qualcomm.com>,
 "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>,
 "Xin Liu" <xin.liu@oss.qualcomm.com>,
 "Yuanjie Yang" <yuanjie.yang@oss.qualcomm.com>,
 "Aaron Kling" <webgeek1234@gmail.com>,
 "Aleksandrs Vinarskis" <alex@vinarskis.com>,
 "Alexander Koskovich" <AKoskovich@pm.me>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Christopher Obbard" <christopher.obbard@linaro.org>,
 "Gabor Juhos" <j4g8y7@gmail.com>,
 "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Gergo Koteles" <soyer@irl.hu>, "Gianluca Boiano" <morf3089@gmail.com>,
 "Hongyang Zhao" <hongyang.zhao@thundersoft.com>,
 "Janaki Ramaiah Thota" <janaki.thota@oss.qualcomm.com>,
 "Jyothi Kumar Seerapu" <jyothi.seerapu@oss.qualcomm.com>,
 KancyJoe <kancy2333@outlook.com>,
 "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>,
 "Le Qi" <le.qi@oss.qualcomm.com>,
 "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>,
 "Manaf Meethalavalappu Pallikunhi" <quic_manafm@quicinc.com>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Max McNamee" <maxmcnamee@proton.me>,
 "Pengyu Luo" <mitltlatltl@gmail.com>,
 "Riccardo Mereu" <r.mereu@arduino.cc>,
 "Richard Acayan" <mailingradian@gmail.com>,
 "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>,
 "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>,
 "Wei Deng" <wei.deng@oss.qualcomm.com>,
 "Wei Zhang" <wei.zhang@oss.qualcomm.com>,
 "Xueyao An" <xueyao.an@oss.qualcomm.com>,
 "Yedaya Katsman" <yedaya.ka@gmail.com>,
 "Zijun Hu" <zijun.hu@oss.qualcomm.com>
Message-Id: <2c5402a1-9724-4fb1-bd31-6e8d133f3b88@app.fastmail.com>
In-Reply-To: <20260401142242.1068620-1-andersson@kernel.org>
References: <20260401142242.1068620-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101584-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,mainlining.org,fairphone.com,packett.cool,linaro.org,gmail.com,ixit.cz,quicinc.com,oldschoolsolutions.biz,posteo.de,debian.org,canonical.com,kernel.org,protonmail.com,vinarskis.com,pm.me,glider.be,irl.hu,thundersoft.com,outlook.com,proton.me,arduino.cc];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCPT_COUNT_GT_50(0.00)[85];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	NEURAL_HAM(-0.00)[-0.957];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim,app.fastmail.com:mid]
X-Rspamd-Queue-Id: B882938EC7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026, at 16:22, Bjorn Andersson wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 
> tags/qcom-arm64-for-7.1
>
> for you to fetch changes up to b683730e27ba4f91986c4c92f5cb7297f1e01a6d:
>
>   arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 
> 09:35:01 -0500)
>
> ----------------------------------------------------------------
> Qualcomm Arm64 DeviceTree updates for v7.1
>
> Introduce the Eliza, Glymur, Mahua, and IPQ5210 Qualcomm SoCs.

I pulled this one as well now. The contents all seem fine to me,
but please try to group the dts changes into smaller branches
so you can send some of it earlier when you know that you
have a large amount of content queued up.

I know this is hard, and I also tend to do things in the
last minute, but it would really help to have e.g. the
newly added SoCs in a separate branch, or even just
the stuff that you know is ready by -rc3.

This pull request alone has 178 files / 258 patches / 38000 lines,
among 686 files / 913 patches / 68376 lines that are queued
up in total across 63 branches we have merged so far for 7.1.

       Arnd

