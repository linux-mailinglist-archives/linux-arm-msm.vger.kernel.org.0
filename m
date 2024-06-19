Return-Path: <linux-arm-msm+bounces-23218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E390EF8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 15:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D65DBB2385C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 13:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2787814F9C9;
	Wed, 19 Jun 2024 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUN4q/Wp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF83144D3E;
	Wed, 19 Jun 2024 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718805505; cv=none; b=T/qIeb535U33GJXcdX3fvwlfRhVTjROkpYNp8E7VK6yF1b/FqEydahX+sUMBcspl81rigWsVeFwBCoq/3z3syzZwvMKUSfFwmtG7I4iaYr9fapY4h3gpKhYF9NK/NCrxSvmd4ztCLw1yjY+qR6TA83bhc3j0aYxT+ef3uOx9P08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718805505; c=relaxed/simple;
	bh=Qv0vtKINOVldm2CdwUmM4M3/iIkMsLOATc8W8L4btPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScvazfBCMjctqmHgoaOPu9D5PpaUsse5ldQpNmXe0WZlJMV6Fg21HEkMY0nCk8ytIDWIrZkiMAIpcMMtmOCFxmrTFJOC+dx2FyYd25PDYiTZmbcsZwqFdfD7SK8nOP7kTHuWQ9Dd+uFka23ad2Ty7xhsB/s0BKwGMGXXMUmEEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUN4q/Wp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718805501; x=1750341501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qv0vtKINOVldm2CdwUmM4M3/iIkMsLOATc8W8L4btPg=;
  b=WUN4q/WppDCOUO+LuhW7hIotOmJZ0oA4aVyVU6Y2XQ/3aVbkz3e7nrlo
   jBu+2TRllk5WOhOSPtyDZ62KYog7GieTI1FW9dnVTdlm2ygYaDnWztxwe
   9MA3bHjVyEgD8PGS8OEeeXvttb/QCT3AdpOvm5FyhTzQNo9mcAKmF1q+L
   kuY/ujazRDkZEBhVvmTl5jttkIx4ZXhNkLD+UH74JSm96rVLUorRATKIC
   4/L3BByPJ44E0aXuDRJP0gCLVgqXbSOKUyaCkr5i0dhpyh4bBhSuKj2ky
   zS9bXo3y/EU126dHFh06ZXSaJ5JtXGZQJUxTJJ1mGWj4BPwJLPcVfKxWv
   w==;
X-CSE-ConnectionGUID: YR2S8nj6TmGeNRhdFZJ9Fw==
X-CSE-MsgGUID: /sAP3AzST0SNkfaxhbtOEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41147973"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="41147973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:58:20 -0700
X-CSE-ConnectionGUID: r0XKg7uYQHK5Ywz4pGKKZg==
X-CSE-MsgGUID: UxStYfWkRfaOGnPIhEb0WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="41758801"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jun 2024 06:58:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJvpD-0006fC-2C;
	Wed, 19 Jun 2024 13:58:11 +0000
Date: Wed, 19 Jun 2024 21:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <quic_jiegan@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Song Chai <quic_songchai@quicinc.com>,
	linux-arm-msm@vger.kernel.org, andersson@kernel.org,
	quic_yijiyang@quicinc.com, quic_yuanjiey@quicinc.com,
	quic_liuxin@quicinc.com, quic_yanzl@quicinc.com,
	quic_xinlon@quicinc.com, quic_xueqnie@quicinc.com,
	quic_sijiwu@quicinc.com
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add CSR and ETR nodes for
 SA8775p
Message-ID: <202406192153.zwXdkSsd-lkp@intel.com>
References: <20240618072726.3767974-4-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618072726.3767974-4-quic_jiegan@quicinc.com>

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240617]
[cannot apply to robh/for-next atorgue-stm32/stm32-next linus/master v6.10-rc4 v6.10-rc3 v6.10-rc2 v6.10-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/dt-bindings-arm-Add-binding-document-for-Coresight-Slave-Register-device/20240618-181003
base:   next-20240617
patch link:    https://lore.kernel.org/r/20240618072726.3767974-4-quic_jiegan%40quicinc.com
patch subject: [PATCH v1 3/3] arm64: dts: qcom: Add CSR and ETR nodes for SA8775p
config: arm64-randconfig-003-20240619 (https://download.01.org/0day-ci/archive/20240619/202406192153.zwXdkSsd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406192153.zwXdkSsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406192153.zwXdkSsd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:1900.14-1911.6: Warning (graph_child_address): /soc@0/replicator@4046000/out-ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1900 arch/arm64/boot/dts/qcom/sa8775p.dtsi

    15	
    16	/ {
    17		interrupt-parent = <&intc>;
    18	
    19		#address-cells = <2>;
    20		#size-cells = <2>;
    21	
    22		clocks {
    23			xo_board_clk: xo-board-clk {
    24				compatible = "fixed-clock";
    25				#clock-cells = <0>;
    26			};
    27	
    28			sleep_clk: sleep-clk {
    29				compatible = "fixed-clock";
    30				#clock-cells = <0>;
    31			};
    32		};
    33	
    34		cpus {
    35			#address-cells = <2>;
    36			#size-cells = <0>;
    37	
    38			CPU0: cpu@0 {
    39				device_type = "cpu";
    40				compatible = "qcom,kryo";
    41				reg = <0x0 0x0>;
    42				enable-method = "psci";
    43				qcom,freq-domain = <&cpufreq_hw 0>;
    44				next-level-cache = <&L2_0>;
    45				L2_0: l2-cache {
    46					compatible = "cache";
    47					cache-level = <2>;
    48					cache-unified;
    49					next-level-cache = <&L3_0>;
    50					L3_0: l3-cache {
    51						compatible = "cache";
    52						cache-level = <3>;
    53						cache-unified;
    54					};
    55				};
    56			};
    57	
    58			CPU1: cpu@100 {
    59				device_type = "cpu";
    60				compatible = "qcom,kryo";
    61				reg = <0x0 0x100>;
    62				enable-method = "psci";
    63				qcom,freq-domain = <&cpufreq_hw 0>;
    64				next-level-cache = <&L2_1>;
    65				L2_1: l2-cache {
    66					compatible = "cache";
    67					cache-level = <2>;
    68					cache-unified;
    69					next-level-cache = <&L3_0>;
    70				};
    71			};
    72	
    73			CPU2: cpu@200 {
    74				device_type = "cpu";
    75				compatible = "qcom,kryo";
    76				reg = <0x0 0x200>;
    77				enable-method = "psci";
    78				qcom,freq-domain = <&cpufreq_hw 0>;
    79				next-level-cache = <&L2_2>;
    80				L2_2: l2-cache {
    81					compatible = "cache";
    82					cache-level = <2>;
    83					cache-unified;
    84					next-level-cache = <&L3_0>;
    85				};
    86			};
    87	
    88			CPU3: cpu@300 {
    89				device_type = "cpu";
    90				compatible = "qcom,kryo";
    91				reg = <0x0 0x300>;
    92				enable-method = "psci";
    93				qcom,freq-domain = <&cpufreq_hw 0>;
    94				next-level-cache = <&L2_3>;
    95				L2_3: l2-cache {
    96					compatible = "cache";
    97					cache-level = <2>;
    98					cache-unified;
    99					next-level-cache = <&L3_0>;
   100				};
   101			};
   102	
   103			CPU4: cpu@10000 {
   104				device_type = "cpu";
   105				compatible = "qcom,kryo";
   106				reg = <0x0 0x10000>;
   107				enable-method = "psci";
   108				qcom,freq-domain = <&cpufreq_hw 1>;
   109				next-level-cache = <&L2_4>;
   110				L2_4: l2-cache {
   111					compatible = "cache";
   112					cache-level = <2>;
   113					cache-unified;
   114					next-level-cache = <&L3_1>;
   115					L3_1: l3-cache {
   116						compatible = "cache";
   117						cache-level = <3>;
   118						cache-unified;
   119					};
   120	
   121				};
   122			};
   123	
   124			CPU5: cpu@10100 {
   125				device_type = "cpu";
   126				compatible = "qcom,kryo";
   127				reg = <0x0 0x10100>;
   128				enable-method = "psci";
   129				qcom,freq-domain = <&cpufreq_hw 1>;
   130				next-level-cache = <&L2_5>;
   131				L2_5: l2-cache {
   132					compatible = "cache";
   133					cache-level = <2>;
   134					cache-unified;
   135					next-level-cache = <&L3_1>;
   136				};
   137			};
   138	
   139			CPU6: cpu@10200 {
   140				device_type = "cpu";
   141				compatible = "qcom,kryo";
   142				reg = <0x0 0x10200>;
   143				enable-method = "psci";
   144				qcom,freq-domain = <&cpufreq_hw 1>;
   145				next-level-cache = <&L2_6>;
   146				L2_6: l2-cache {
   147					compatible = "cache";
   148					cache-level = <2>;
   149					cache-unified;
   150					next-level-cache = <&L3_1>;
   151				};
   152			};
   153	
   154			CPU7: cpu@10300 {
   155				device_type = "cpu";
   156				compatible = "qcom,kryo";
   157				reg = <0x0 0x10300>;
   158				enable-method = "psci";
   159				qcom,freq-domain = <&cpufreq_hw 1>;
   160				next-level-cache = <&L2_7>;
   161				L2_7: l2-cache {
   162					compatible = "cache";
   163					cache-level = <2>;
   164					cache-unified;
   165					next-level-cache = <&L3_1>;
   166				};
   167			};
   168	
   169			cpu-map {
   170				cluster0 {
   171					core0 {
   172						cpu = <&CPU0>;
   173					};
   174	
   175					core1 {
   176						cpu = <&CPU1>;
   177					};
   178	
   179					core2 {
   180						cpu = <&CPU2>;
   181					};
   182	
   183					core3 {
   184						cpu = <&CPU3>;
   185					};
   186				};
   187	
   188				cluster1 {
   189					core0 {
   190						cpu = <&CPU4>;
   191					};
   192	
   193					core1 {
   194						cpu = <&CPU5>;
   195					};
   196	
   197					core2 {
   198						cpu = <&CPU6>;
   199					};
   200	
   201					core3 {
   202						cpu = <&CPU7>;
   203					};
   204				};
   205			};
   206		};
   207	
   208		dummy-sink {
   209			compatible = "arm,coresight-dummy-sink";
   210	
   211			in-ports {
   212				port {
   213					eud_in: endpoint {
   214						remote-endpoint =
   215						<&swao_rep_out1>;
   216					};
   217				};
   218			};
   219		};
   220	
   221		firmware {
   222			scm {
   223				compatible = "qcom,scm-sa8775p", "qcom,scm";
   224			};
   225		};
   226	
   227		aggre1_noc: interconnect-aggre1-noc {
   228			compatible = "qcom,sa8775p-aggre1-noc";
   229			#interconnect-cells = <2>;
   230			qcom,bcm-voters = <&apps_bcm_voter>;
   231		};
   232	
   233		aggre2_noc: interconnect-aggre2-noc {
   234			compatible = "qcom,sa8775p-aggre2-noc";
   235			#interconnect-cells = <2>;
   236			qcom,bcm-voters = <&apps_bcm_voter>;
   237		};
   238	
   239		clk_virt: interconnect-clk-virt {
   240			compatible = "qcom,sa8775p-clk-virt";
   241			#interconnect-cells = <2>;
   242			qcom,bcm-voters = <&apps_bcm_voter>;
   243		};
   244	
   245		config_noc: interconnect-config-noc {
   246			compatible = "qcom,sa8775p-config-noc";
   247			#interconnect-cells = <2>;
   248			qcom,bcm-voters = <&apps_bcm_voter>;
   249		};
   250	
   251		dc_noc: interconnect-dc-noc {
   252			compatible = "qcom,sa8775p-dc-noc";
   253			#interconnect-cells = <2>;
   254			qcom,bcm-voters = <&apps_bcm_voter>;
   255		};
   256	
   257		gem_noc: interconnect-gem-noc {
   258			compatible = "qcom,sa8775p-gem-noc";
   259			#interconnect-cells = <2>;
   260			qcom,bcm-voters = <&apps_bcm_voter>;
   261		};
   262	
   263		gpdsp_anoc: interconnect-gpdsp-anoc {
   264			compatible = "qcom,sa8775p-gpdsp-anoc";
   265			#interconnect-cells = <2>;
   266			qcom,bcm-voters = <&apps_bcm_voter>;
   267		};
   268	
   269		lpass_ag_noc: interconnect-lpass-ag-noc {
   270			compatible = "qcom,sa8775p-lpass-ag-noc";
   271			#interconnect-cells = <2>;
   272			qcom,bcm-voters = <&apps_bcm_voter>;
   273		};
   274	
   275		mc_virt: interconnect-mc-virt {
   276			compatible = "qcom,sa8775p-mc-virt";
   277			#interconnect-cells = <2>;
   278			qcom,bcm-voters = <&apps_bcm_voter>;
   279		};
   280	
   281		mmss_noc: interconnect-mmss-noc {
   282			compatible = "qcom,sa8775p-mmss-noc";
   283			#interconnect-cells = <2>;
   284			qcom,bcm-voters = <&apps_bcm_voter>;
   285		};
   286	
   287		nspa_noc: interconnect-nspa-noc {
   288			compatible = "qcom,sa8775p-nspa-noc";
   289			#interconnect-cells = <2>;
   290			qcom,bcm-voters = <&apps_bcm_voter>;
   291		};
   292	
   293		nspb_noc: interconnect-nspb-noc {
   294			compatible = "qcom,sa8775p-nspb-noc";
   295			#interconnect-cells = <2>;
   296			qcom,bcm-voters = <&apps_bcm_voter>;
   297		};
   298	
   299		pcie_anoc: interconnect-pcie-anoc {
   300			compatible = "qcom,sa8775p-pcie-anoc";
   301			#interconnect-cells = <2>;
   302			qcom,bcm-voters = <&apps_bcm_voter>;
   303		};
   304	
   305		system_noc: interconnect-system-noc {
   306			compatible = "qcom,sa8775p-system-noc";
   307			#interconnect-cells = <2>;
   308			qcom,bcm-voters = <&apps_bcm_voter>;
   309		};
   310	
   311		/* Will be updated by the bootloader. */
   312		memory@80000000 {
   313			device_type = "memory";
   314			reg = <0x0 0x80000000 0x0 0x0>;
   315		};
   316	
   317		qup_opp_table_100mhz: opp-table-qup100mhz {
   318			compatible = "operating-points-v2";
   319	
   320			opp-100000000 {
   321				opp-hz = /bits/ 64 <100000000>;
   322				required-opps = <&rpmhpd_opp_svs_l1>;
   323			};
   324		};
   325	
   326		pmu {
   327			compatible = "arm,armv8-pmuv3";
   328			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
   329		};
   330	
   331		psci {
   332			compatible = "arm,psci-1.0";
   333			method = "smc";
   334		};
   335	
   336		reserved-memory {
   337			#address-cells = <2>;
   338			#size-cells = <2>;
   339			ranges;
   340	
   341			sail_ss_mem: sail-ss@80000000 {
   342				reg = <0x0 0x80000000 0x0 0x10000000>;
   343				no-map;
   344			};
   345	
   346			hyp_mem: hyp@90000000 {
   347				reg = <0x0 0x90000000 0x0 0x600000>;
   348				no-map;
   349			};
   350	
   351			xbl_boot_mem: xbl-boot@90600000 {
   352				reg = <0x0 0x90600000 0x0 0x200000>;
   353				no-map;
   354			};
   355	
   356			aop_image_mem: aop-image@90800000 {
   357				reg = <0x0 0x90800000 0x0 0x60000>;
   358				no-map;
   359			};
   360	
   361			aop_cmd_db_mem: aop-cmd-db@90860000 {
   362				compatible = "qcom,cmd-db";
   363				reg = <0x0 0x90860000 0x0 0x20000>;
   364				no-map;
   365			};
   366	
   367			uefi_log: uefi-log@908b0000 {
   368				reg = <0x0 0x908b0000 0x0 0x10000>;
   369				no-map;
   370			};
   371	
   372			ddr_training_checksum: ddr-training-checksum@908c0000 {
   373				reg = <0x0 0x908c0000 0x0 0x1000>;
   374				no-map;
   375			};
   376	
   377			reserved_mem: reserved@908f0000 {
   378				reg = <0x0 0x908f0000 0x0 0xe000>;
   379				no-map;
   380			};
   381	
   382			secdata_apss_mem: secdata-apss@908fe000 {
   383				reg = <0x0 0x908fe000 0x0 0x2000>;
   384				no-map;
   385			};
   386	
   387			smem_mem: smem@90900000 {
   388				compatible = "qcom,smem";
   389				reg = <0x0 0x90900000 0x0 0x200000>;
   390				no-map;
   391				hwlocks = <&tcsr_mutex 3>;
   392			};
   393	
   394			tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
   395				reg = <0x0 0x90c00000 0x0 0x100000>;
   396				no-map;
   397			};
   398	
   399			sail_mailbox_mem: sail-ss@90d00000 {
   400				reg = <0x0 0x90d00000 0x0 0x100000>;
   401				no-map;
   402			};
   403	
   404			sail_ota_mem: sail-ss@90e00000 {
   405				reg = <0x0 0x90e00000 0x0 0x300000>;
   406				no-map;
   407			};
   408	
   409			aoss_backup_mem: aoss-backup@91b00000 {
   410				reg = <0x0 0x91b00000 0x0 0x40000>;
   411				no-map;
   412			};
   413	
   414			cpucp_backup_mem: cpucp-backup@91b40000 {
   415				reg = <0x0 0x91b40000 0x0 0x40000>;
   416				no-map;
   417			};
   418	
   419			tz_config_backup_mem: tz-config-backup@91b80000 {
   420				reg = <0x0 0x91b80000 0x0 0x10000>;
   421				no-map;
   422			};
   423	
   424			ddr_training_data_mem: ddr-training-data@91b90000 {
   425				reg = <0x0 0x91b90000 0x0 0x10000>;
   426				no-map;
   427			};
   428	
   429			cdt_data_backup_mem: cdt-data-backup@91ba0000 {
   430				reg = <0x0 0x91ba0000 0x0 0x1000>;
   431				no-map;
   432			};
   433	
   434			lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
   435				reg = <0x0 0x93b00000 0x0 0xf00000>;
   436				no-map;
   437			};
   438	
   439			adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@94a00000 {
   440				reg = <0x0 0x94a00000 0x0 0x800000>;
   441				no-map;
   442			};
   443	
   444			pil_camera_mem: pil-camera@95200000 {
   445				reg = <0x0 0x95200000 0x0 0x500000>;
   446				no-map;
   447			};
   448	
   449			pil_adsp_mem: pil-adsp@95c00000 {
   450				reg = <0x0 0x95c00000 0x0 0x1e00000>;
   451				no-map;
   452			};
   453	
   454			pil_gdsp0_mem: pil-gdsp0@97b00000 {
   455				reg = <0x0 0x97b00000 0x0 0x1e00000>;
   456				no-map;
   457			};
   458	
   459			pil_gdsp1_mem: pil-gdsp1@99900000 {
   460				reg = <0x0 0x99900000 0x0 0x1e00000>;
   461				no-map;
   462			};
   463	
   464			pil_cdsp0_mem: pil-cdsp0@9b800000 {
   465				reg = <0x0 0x9b800000 0x0 0x1e00000>;
   466				no-map;
   467			};
   468	
   469			pil_gpu_mem: pil-gpu@9d600000 {
   470				reg = <0x0 0x9d600000 0x0 0x2000>;
   471				no-map;
   472			};
   473	
   474			pil_cdsp1_mem: pil-cdsp1@9d700000 {
   475				reg = <0x0 0x9d700000 0x0 0x1e00000>;
   476				no-map;
   477			};
   478	
   479			pil_cvp_mem: pil-cvp@9f500000 {
   480				reg = <0x0 0x9f500000 0x0 0x700000>;
   481				no-map;
   482			};
   483	
   484			pil_video_mem: pil-video@9fc00000 {
   485				reg = <0x0 0x9fc00000 0x0 0x700000>;
   486				no-map;
   487			};
   488	
   489			audio_mdf_mem: audio-mdf-region@ae000000 {
   490				reg = <0x0 0xae000000 0x0 0x1000000>;
   491				no-map;
   492			};
   493	
   494			firmware_mem: firmware-region@b0000000 {
   495				reg = <0x0 0xb0000000 0x0 0x800000>;
   496				no-map;
   497			};
   498	
   499			hyptz_reserved_mem: hyptz-reserved@beb00000 {
   500				reg = <0x0 0xbeb00000 0x0 0x11500000>;
   501				no-map;
   502			};
   503	
   504			scmi_mem: scmi-region@d0000000 {
   505				reg = <0x0 0xd0000000 0x0 0x40000>;
   506				no-map;
   507			};
   508	
   509			firmware_logs_mem: firmware-logs@d0040000 {
   510				reg = <0x0 0xd0040000 0x0 0x10000>;
   511				no-map;
   512			};
   513	
   514			firmware_audio_mem: firmware-audio@d0050000 {
   515				reg = <0x0 0xd0050000 0x0 0x4000>;
   516				no-map;
   517			};
   518	
   519			firmware_reserved_mem: firmware-reserved@d0054000 {
   520				reg = <0x0 0xd0054000 0x0 0x9c000>;
   521				no-map;
   522			};
   523	
   524			firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
   525				reg = <0x0 0xd00f0000 0x0 0x10000>;
   526				no-map;
   527			};
   528	
   529			tags_mem: tags@d0100000 {
   530				reg = <0x0 0xd0100000 0x0 0x1200000>;
   531				no-map;
   532			};
   533	
   534			qtee_mem: qtee@d1300000 {
   535				reg = <0x0 0xd1300000 0x0 0x500000>;
   536				no-map;
   537			};
   538	
   539			deepsleep_backup_mem: deepsleep-backup@d1800000 {
   540				reg = <0x0 0xd1800000 0x0 0x100000>;
   541				no-map;
   542			};
   543	
   544			trusted_apps_mem: trusted-apps@d1900000 {
   545				reg = <0x0 0xd1900000 0x0 0x3800000>;
   546				no-map;
   547			};
   548	
   549			tz_stat_mem: tz-stat@db100000 {
   550				reg = <0x0 0xdb100000 0x0 0x100000>;
   551				no-map;
   552			};
   553	
   554			cpucp_fw_mem: cpucp-fw@db200000 {
   555				reg = <0x0 0xdb200000 0x0 0x100000>;
   556				no-map;
   557			};
   558		};
   559	
   560		soc: soc@0 {
   561			compatible = "simple-bus";
   562			#address-cells = <2>;
   563			#size-cells = <2>;
   564			ranges = <0 0 0 0 0x10 0>;
   565	
   566			gcc: clock-controller@100000 {
   567				compatible = "qcom,sa8775p-gcc";
   568				reg = <0x0 0x00100000 0x0 0xc7018>;
   569				#clock-cells = <1>;
   570				#reset-cells = <1>;
   571				#power-domain-cells = <1>;
   572				clocks = <&rpmhcc RPMH_CXO_CLK>,
   573					 <&sleep_clk>,
   574					 <0>,
   575					 <0>,
   576					 <0>,
   577					 <&usb_0_qmpphy>,
   578					 <&usb_1_qmpphy>,
   579					 <0>,
   580					 <0>,
   581					 <0>,
   582					 <&pcie0_phy>,
   583					 <&pcie1_phy>,
   584					 <0>,
   585					 <0>,
   586					 <0>;
   587				power-domains = <&rpmhpd SA8775P_CX>;
   588			};
   589	
   590			ipcc: mailbox@408000 {
   591				compatible = "qcom,sa8775p-ipcc", "qcom,ipcc";
   592				reg = <0x0 0x00408000 0x0 0x1000>;
   593				interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
   594				interrupt-controller;
   595				#interrupt-cells = <3>;
   596				#mbox-cells = <2>;
   597			};
   598	
   599			qupv3_id_2: geniqup@8c0000 {
   600				compatible = "qcom,geni-se-qup";
   601				reg = <0x0 0x008c0000 0x0 0x6000>;
   602				ranges;
   603				clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
   604					 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
   605				clock-names = "m-ahb", "s-ahb";
   606				iommus = <&apps_smmu 0x5a3 0x0>;
   607				#address-cells = <2>;
   608				#size-cells = <2>;
   609				status = "disabled";
   610	
   611				i2c14: i2c@880000 {
   612					compatible = "qcom,geni-i2c";
   613					reg = <0x0 0x880000 0x0 0x4000>;
   614					#address-cells = <1>;
   615					#size-cells = <0>;
   616					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
   617					clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
   618					clock-names = "se";
   619					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   620							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   621							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   622							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   623							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   624							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   625					interconnect-names = "qup-core",
   626							     "qup-config",
   627							     "qup-memory";
   628					power-domains = <&rpmhpd SA8775P_CX>;
   629					status = "disabled";
   630				};
   631	
   632				spi14: spi@880000 {
   633					compatible = "qcom,geni-spi";
   634					reg = <0x0 0x880000 0x0 0x4000>;
   635					#address-cells = <1>;
   636					#size-cells = <0>;
   637					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
   638					clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
   639					clock-names = "se";
   640					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   641							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   642							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   643							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   644							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   645							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   646					interconnect-names = "qup-core",
   647							     "qup-config",
   648							     "qup-memory";
   649					power-domains = <&rpmhpd SA8775P_CX>;
   650					status = "disabled";
   651				};
   652	
   653				i2c15: i2c@884000 {
   654					compatible = "qcom,geni-i2c";
   655					reg = <0x0 0x884000 0x0 0x4000>;
   656					#address-cells = <1>;
   657					#size-cells = <0>;
   658					interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
   659					clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
   660					clock-names = "se";
   661					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   662							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   663							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   664							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   665							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   666							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   667					interconnect-names = "qup-core",
   668							     "qup-config",
   669							     "qup-memory";
   670					power-domains = <&rpmhpd SA8775P_CX>;
   671					status = "disabled";
   672				};
   673	
   674				spi15: spi@884000 {
   675					compatible = "qcom,geni-spi";
   676					reg = <0x0 0x884000 0x0 0x4000>;
   677					#address-cells = <1>;
   678					#size-cells = <0>;
   679					interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
   680					clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
   681					clock-names = "se";
   682					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   683							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   684							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   685							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   686							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   687							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   688					interconnect-names = "qup-core",
   689							     "qup-config",
   690							     "qup-memory";
   691					power-domains = <&rpmhpd SA8775P_CX>;
   692					status = "disabled";
   693				};
   694	
   695				i2c16: i2c@888000 {
   696					compatible = "qcom,geni-i2c";
   697					reg = <0x0 0x888000 0x0 0x4000>;
   698					#address-cells = <1>;
   699					#size-cells = <0>;
   700					interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
   701					clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
   702					clock-names = "se";
   703					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   704							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   705							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   706							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   707							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   708							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   709					interconnect-names = "qup-core",
   710							     "qup-config",
   711							     "qup-memory";
   712					power-domains = <&rpmhpd SA8775P_CX>;
   713					status = "disabled";
   714				};
   715	
   716				spi16: spi@888000 {
   717					compatible = "qcom,geni-spi";
   718					reg = <0x0 0x00888000 0x0 0x4000>;
   719					interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
   720					clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
   721					clock-names = "se";
   722					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   723							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   724							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   725							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   726							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   727							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   728					interconnect-names = "qup-core",
   729							     "qup-config",
   730							     "qup-memory";
   731					power-domains = <&rpmhpd SA8775P_CX>;
   732					#address-cells = <1>;
   733					#size-cells = <0>;
   734					status = "disabled";
   735				};
   736	
   737				i2c17: i2c@88c000 {
   738					compatible = "qcom,geni-i2c";
   739					reg = <0x0 0x88c000 0x0 0x4000>;
   740					#address-cells = <1>;
   741					#size-cells = <0>;
   742					interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
   743					clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
   744					clock-names = "se";
   745					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   746							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   747							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   748							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   749							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   750							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   751					interconnect-names = "qup-core",
   752							     "qup-config",
   753							     "qup-memory";
   754					power-domains = <&rpmhpd SA8775P_CX>;
   755					status = "disabled";
   756				};
   757	
   758				spi17: spi@88c000 {
   759					compatible = "qcom,geni-spi";
   760					reg = <0x0 0x88c000 0x0 0x4000>;
   761					#address-cells = <1>;
   762					#size-cells = <0>;
   763					interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
   764					clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
   765					clock-names = "se";
   766					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   767							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   768							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   769							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   770							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   771							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   772					interconnect-names = "qup-core",
   773							     "qup-config",
   774							     "qup-memory";
   775					power-domains = <&rpmhpd SA8775P_CX>;
   776					status = "disabled";
   777				};
   778	
   779				uart17: serial@88c000 {
   780					compatible = "qcom,geni-uart";
   781					reg = <0x0 0x0088c000 0x0 0x4000>;
   782					interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
   783					clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
   784					clock-names = "se";
   785					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   786							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   787							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   788							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
   789					interconnect-names = "qup-core", "qup-config";
   790					power-domains = <&rpmhpd SA8775P_CX>;
   791					status = "disabled";
   792				};
   793	
   794				i2c18: i2c@890000 {
   795					compatible = "qcom,geni-i2c";
   796					reg = <0x0 0x00890000 0x0 0x4000>;
   797					interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
   798					clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
   799					clock-names = "se";
   800					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   801							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   802							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   803							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   804							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   805							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   806					interconnect-names = "qup-core",
   807							     "qup-config",
   808							     "qup-memory";
   809					power-domains = <&rpmhpd SA8775P_CX>;
   810					#address-cells = <1>;
   811					#size-cells = <0>;
   812					status = "disabled";
   813				};
   814	
   815				spi18: spi@890000 {
   816					compatible = "qcom,geni-spi";
   817					reg = <0x0 0x890000 0x0 0x4000>;
   818					#address-cells = <1>;
   819					#size-cells = <0>;
   820					interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
   821					clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
   822					clock-names = "se";
   823					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   824							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   825							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   826							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   827							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   828							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   829					interconnect-names = "qup-core",
   830							     "qup-config",
   831							     "qup-memory";
   832					power-domains = <&rpmhpd SA8775P_CX>;
   833					status = "disabled";
   834				};
   835	
   836				i2c19: i2c@894000 {
   837					compatible = "qcom,geni-i2c";
   838					reg = <0x0 0x894000 0x0 0x4000>;
   839					#address-cells = <1>;
   840					#size-cells = <0>;
   841					interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
   842					clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
   843					clock-names = "se";
   844					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   845							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   846							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   847							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   848							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   849							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   850					interconnect-names = "qup-core",
   851							     "qup-config",
   852							     "qup-memory";
   853					power-domains = <&rpmhpd SA8775P_CX>;
   854					status = "disabled";
   855				};
   856	
   857				spi19: spi@894000 {
   858					compatible = "qcom,geni-spi";
   859					reg = <0x0 0x894000 0x0 0x4000>;
   860					#address-cells = <1>;
   861					#size-cells = <0>;
   862					interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
   863					clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
   864					clock-names = "se";
   865					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   866							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   867							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   868							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   869							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   870							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   871					interconnect-names = "qup-core",
   872							     "qup-config",
   873							     "qup-memory";
   874					power-domains = <&rpmhpd SA8775P_CX>;
   875					status = "disabled";
   876				};
   877	
   878				i2c20: i2c@898000 {
   879					compatible = "qcom,geni-i2c";
   880					reg = <0x0 0x898000 0x0 0x4000>;
   881					#address-cells = <1>;
   882					#size-cells = <0>;
   883					interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
   884					clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
   885					clock-names = "se";
   886					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   887							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   888							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   889							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   890							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   891							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   892					interconnect-names = "qup-core",
   893							     "qup-config",
   894							     "qup-memory";
   895					power-domains = <&rpmhpd SA8775P_CX>;
   896					status = "disabled";
   897				};
   898	
   899				spi20: spi@898000 {
   900					compatible = "qcom,geni-spi";
   901					reg = <0x0 0x898000 0x0 0x4000>;
   902					#address-cells = <1>;
   903					#size-cells = <0>;
   904					interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
   905					clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
   906					clock-names = "se";
   907					interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
   908							 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
   909							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   910							 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
   911							<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
   912							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   913					interconnect-names = "qup-core",
   914							     "qup-config",
   915							     "qup-memory";
   916					power-domains = <&rpmhpd SA8775P_CX>;
   917					status = "disabled";
   918				};
   919			};
   920	
   921			qupv3_id_0: geniqup@9c0000 {
   922				compatible = "qcom,geni-se-qup";
   923				reg = <0x0 0x9c0000 0x0 0x6000>;
   924				#address-cells = <2>;
   925				#size-cells = <2>;
   926				ranges;
   927				clock-names = "m-ahb", "s-ahb";
   928				clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
   929					<&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
   930				iommus = <&apps_smmu 0x403 0x0>;
   931				status = "disabled";
   932	
   933				i2c0: i2c@980000 {
   934					compatible = "qcom,geni-i2c";
   935					reg = <0x0 0x980000 0x0 0x4000>;
   936					#address-cells = <1>;
   937					#size-cells = <0>;
   938					interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
   939					clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
   940					clock-names = "se";
   941					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   942							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   943							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   944							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
   945							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   946							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   947					interconnect-names = "qup-core",
   948							     "qup-config",
   949							     "qup-memory";
   950					power-domains = <&rpmhpd SA8775P_CX>;
   951					status = "disabled";
   952				};
   953	
   954				spi0: spi@980000 {
   955					compatible = "qcom,geni-spi";
   956					reg = <0x0 0x980000 0x0 0x4000>;
   957					#address-cells = <1>;
   958					#size-cells = <0>;
   959					interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
   960					clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
   961					clock-names = "se";
   962					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   963							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   964							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   965							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
   966							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   967							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   968					interconnect-names = "qup-core",
   969							     "qup-config",
   970							     "qup-memory";
   971					power-domains = <&rpmhpd SA8775P_CX>;
   972					status = "disabled";
   973				};
   974	
   975				i2c1: i2c@984000 {
   976					compatible = "qcom,geni-i2c";
   977					reg = <0x0 0x984000 0x0 0x4000>;
   978					#address-cells = <1>;
   979					#size-cells = <0>;
   980					interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
   981					clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
   982					clock-names = "se";
   983					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   984							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   985							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   986							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
   987							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   988							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   989					interconnect-names = "qup-core",
   990							     "qup-config",
   991							     "qup-memory";
   992					power-domains = <&rpmhpd SA8775P_CX>;
   993					status = "disabled";
   994				};
   995	
   996				spi1: spi@984000 {
   997					compatible = "qcom,geni-spi";
   998					reg = <0x0 0x984000 0x0 0x4000>;
   999					#address-cells = <1>;
  1000					#size-cells = <0>;
  1001					interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
  1002					clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
  1003					clock-names = "se";
  1004					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1005							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1006							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1007							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1008							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1009							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1010					interconnect-names = "qup-core",
  1011							     "qup-config",
  1012							     "qup-memory";
  1013					power-domains = <&rpmhpd SA8775P_CX>;
  1014					status = "disabled";
  1015				};
  1016	
  1017				i2c2: i2c@988000 {
  1018					compatible = "qcom,geni-i2c";
  1019					reg = <0x0 0x988000 0x0 0x4000>;
  1020					#address-cells = <1>;
  1021					#size-cells = <0>;
  1022					interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
  1023					clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
  1024					clock-names = "se";
  1025					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1026							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1027							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1028							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1029							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1030							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1031					interconnect-names = "qup-core",
  1032							     "qup-config",
  1033							     "qup-memory";
  1034					power-domains = <&rpmhpd SA8775P_CX>;
  1035					status = "disabled";
  1036				};
  1037	
  1038				spi2: spi@988000 {
  1039					compatible = "qcom,geni-spi";
  1040					reg = <0x0 0x988000 0x0 0x4000>;
  1041					#address-cells = <1>;
  1042					#size-cells = <0>;
  1043					interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
  1044					clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
  1045					clock-names = "se";
  1046					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1047							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1048							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1049							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1050							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1051							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1052					interconnect-names = "qup-core",
  1053							     "qup-config",
  1054							     "qup-memory";
  1055					power-domains = <&rpmhpd SA8775P_CX>;
  1056					status = "disabled";
  1057				};
  1058	
  1059				i2c3: i2c@98c000 {
  1060					compatible = "qcom,geni-i2c";
  1061					reg = <0x0 0x98c000 0x0 0x4000>;
  1062					#address-cells = <1>;
  1063					#size-cells = <0>;
  1064					interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
  1065					clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
  1066					clock-names = "se";
  1067					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1068							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1069							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1070							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1071							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1072							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1073					interconnect-names = "qup-core",
  1074							     "qup-config",
  1075							     "qup-memory";
  1076					power-domains = <&rpmhpd SA8775P_CX>;
  1077					status = "disabled";
  1078				};
  1079	
  1080				spi3: spi@98c000 {
  1081					compatible = "qcom,geni-spi";
  1082					reg = <0x0 0x98c000 0x0 0x4000>;
  1083					#address-cells = <1>;
  1084					#size-cells = <0>;
  1085					interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
  1086					clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
  1087					clock-names = "se";
  1088					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1089							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1090							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1091							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1092							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1093							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1094					interconnect-names = "qup-core",
  1095							     "qup-config",
  1096							     "qup-memory";
  1097					power-domains = <&rpmhpd SA8775P_CX>;
  1098					status = "disabled";
  1099				};
  1100	
  1101				i2c4: i2c@990000 {
  1102					compatible = "qcom,geni-i2c";
  1103					reg = <0x0 0x990000 0x0 0x4000>;
  1104					#address-cells = <1>;
  1105					#size-cells = <0>;
  1106					interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
  1107					clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
  1108					clock-names = "se";
  1109					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1110							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1111							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1112							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1113							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1114							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1115					interconnect-names = "qup-core",
  1116							     "qup-config",
  1117							     "qup-memory";
  1118					power-domains = <&rpmhpd SA8775P_CX>;
  1119					status = "disabled";
  1120				};
  1121	
  1122				spi4: spi@990000 {
  1123					compatible = "qcom,geni-spi";
  1124					reg = <0x0 0x990000 0x0 0x4000>;
  1125					#address-cells = <1>;
  1126					#size-cells = <0>;
  1127					interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
  1128					clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
  1129					clock-names = "se";
  1130					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1131							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1132							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1133							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1134							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1135							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1136					interconnect-names = "qup-core",
  1137							     "qup-config",
  1138							     "qup-memory";
  1139					power-domains = <&rpmhpd SA8775P_CX>;
  1140					status = "disabled";
  1141				};
  1142	
  1143				i2c5: i2c@994000 {
  1144					compatible = "qcom,geni-i2c";
  1145					reg = <0x0 0x994000 0x0 0x4000>;
  1146					#address-cells = <1>;
  1147					#size-cells = <0>;
  1148					interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
  1149					clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
  1150					clock-names = "se";
  1151					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1152							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1153							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1154							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1155							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1156							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1157					interconnect-names = "qup-core",
  1158							     "qup-config",
  1159							     "qup-memory";
  1160					power-domains = <&rpmhpd SA8775P_CX>;
  1161					status = "disabled";
  1162				};
  1163	
  1164				spi5: spi@994000 {
  1165					compatible = "qcom,geni-spi";
  1166					reg = <0x0 0x994000 0x0 0x4000>;
  1167					#address-cells = <1>;
  1168					#size-cells = <0>;
  1169					interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
  1170					clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
  1171					clock-names = "se";
  1172					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1173							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1174							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1175							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
  1176							<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
  1177							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1178					interconnect-names = "qup-core",
  1179							     "qup-config",
  1180							     "qup-memory";
  1181					power-domains = <&rpmhpd SA8775P_CX>;
  1182					status = "disabled";
  1183				};
  1184	
  1185				uart5: serial@994000 {
  1186					compatible = "qcom,geni-uart";
  1187					reg = <0x0 0x994000 0x0 0x4000>;
  1188					interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
  1189					clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
  1190					clock-names = "se";
  1191					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
  1192							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
  1193							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1194							 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
  1195					interconnect-names = "qup-core", "qup-config";
  1196					power-domains = <&rpmhpd SA8775P_CX>;
  1197					status = "disabled";
  1198				};
  1199			};
  1200	
  1201			qupv3_id_1: geniqup@ac0000 {
  1202				compatible = "qcom,geni-se-qup";
  1203				reg = <0x0 0x00ac0000 0x0 0x6000>;
  1204				#address-cells = <2>;
  1205				#size-cells = <2>;
  1206				ranges;
  1207				clock-names = "m-ahb", "s-ahb";
  1208				clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
  1209					 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
  1210				iommus = <&apps_smmu 0x443 0x0>;
  1211				status = "disabled";
  1212	
  1213				i2c7: i2c@a80000 {
  1214					compatible = "qcom,geni-i2c";
  1215					reg = <0x0 0xa80000 0x0 0x4000>;
  1216					#address-cells = <1>;
  1217					#size-cells = <0>;
  1218					interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
  1219					clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
  1220					clock-names = "se";
  1221					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1222							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1223							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1224							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1225							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1226							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1227					interconnect-names = "qup-core",
  1228							     "qup-config",
  1229							     "qup-memory";
  1230					power-domains = <&rpmhpd SA8775P_CX>;
  1231					status = "disabled";
  1232				};
  1233	
  1234				spi7: spi@a80000 {
  1235					compatible = "qcom,geni-spi";
  1236					reg = <0x0 0xa80000 0x0 0x4000>;
  1237					#address-cells = <1>;
  1238					#size-cells = <0>;
  1239					interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
  1240					clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
  1241					clock-names = "se";
  1242					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1243							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1244							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1245							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1246							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1247							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1248					interconnect-names = "qup-core",
  1249							     "qup-config",
  1250							     "qup-memory";
  1251					power-domains = <&rpmhpd SA8775P_CX>;
  1252					status = "disabled";
  1253				};
  1254	
  1255				i2c8: i2c@a84000 {
  1256					compatible = "qcom,geni-i2c";
  1257					reg = <0x0 0xa84000 0x0 0x4000>;
  1258					#address-cells = <1>;
  1259					#size-cells = <0>;
  1260					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
  1261					clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
  1262					clock-names = "se";
  1263					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1264							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1265							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1266							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1267							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1268							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1269					interconnect-names = "qup-core",
  1270							     "qup-config",
  1271							     "qup-memory";
  1272					power-domains = <&rpmhpd SA8775P_CX>;
  1273					status = "disabled";
  1274				};
  1275	
  1276				spi8: spi@a84000 {
  1277					compatible = "qcom,geni-spi";
  1278					reg = <0x0 0xa84000 0x0 0x4000>;
  1279					#address-cells = <1>;
  1280					#size-cells = <0>;
  1281					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
  1282					clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
  1283					clock-names = "se";
  1284					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1285							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1286							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1287							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1288							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1289							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1290					interconnect-names = "qup-core",
  1291							     "qup-config",
  1292							     "qup-memory";
  1293					power-domains = <&rpmhpd SA8775P_CX>;
  1294					status = "disabled";
  1295				};
  1296	
  1297				i2c9: i2c@a88000 {
  1298					compatible = "qcom,geni-i2c";
  1299					reg = <0x0 0xa88000 0x0 0x4000>;
  1300					#address-cells = <1>;
  1301					#size-cells = <0>;
  1302					interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
  1303					clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
  1304					clock-names = "se";
  1305					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1306							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1307							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1308							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1309							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1310							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1311					interconnect-names = "qup-core",
  1312							     "qup-config",
  1313							     "qup-memory";
  1314					power-domains = <&rpmhpd SA8775P_CX>;
  1315					status = "disabled";
  1316				};
  1317	
  1318				spi9: spi@a88000 {
  1319					compatible = "qcom,geni-spi";
  1320					reg = <0x0 0xa88000 0x0 0x4000>;
  1321					#address-cells = <1>;
  1322					#size-cells = <0>;
  1323					interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
  1324					clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
  1325					clock-names = "se";
  1326					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1327							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1328							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1329							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1330							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1331							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1332					interconnect-names = "qup-core",
  1333							     "qup-config",
  1334							     "qup-memory";
  1335					power-domains = <&rpmhpd SA8775P_CX>;
  1336					status = "disabled";
  1337				};
  1338	
  1339				uart9: serial@a88000 {
  1340					compatible = "qcom,geni-uart";
  1341					reg = <0x0 0xa88000 0x0 0x4000>;
  1342					interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
  1343					clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
  1344					clock-names = "se";
  1345					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1346							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1347							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1348							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
  1349					interconnect-names = "qup-core", "qup-config";
  1350					power-domains = <&rpmhpd SA8775P_CX>;
  1351					status = "disabled";
  1352				};
  1353	
  1354				i2c10: i2c@a8c000 {
  1355					compatible = "qcom,geni-i2c";
  1356					reg = <0x0 0xa8c000 0x0 0x4000>;
  1357					#address-cells = <1>;
  1358					#size-cells = <0>;
  1359					interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
  1360					clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
  1361					clock-names = "se";
  1362					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1363							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1364							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1365							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1366							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1367							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1368					interconnect-names = "qup-core",
  1369							     "qup-config",
  1370							     "qup-memory";
  1371					power-domains = <&rpmhpd SA8775P_CX>;
  1372					status = "disabled";
  1373				};
  1374	
  1375				spi10: spi@a8c000 {
  1376					compatible = "qcom,geni-spi";
  1377					reg = <0x0 0xa8c000 0x0 0x4000>;
  1378					#address-cells = <1>;
  1379					#size-cells = <0>;
  1380					interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
  1381					clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
  1382					clock-names = "se";
  1383					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1384							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1385							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1386							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1387							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1388							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1389					interconnect-names = "qup-core",
  1390							     "qup-config",
  1391							     "qup-memory";
  1392					power-domains = <&rpmhpd SA8775P_CX>;
  1393					status = "disabled";
  1394				};
  1395	
  1396				uart10: serial@a8c000 {
  1397					compatible = "qcom,geni-uart";
  1398					reg = <0x0 0x00a8c000 0x0 0x4000>;
  1399					interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
  1400					clock-names = "se";
  1401					clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
  1402					interconnect-names = "qup-core", "qup-config";
  1403					interconnects = <&clk_virt MASTER_QUP_CORE_1 0
  1404							 &clk_virt SLAVE_QUP_CORE_1 0>,
  1405							<&gem_noc MASTER_APPSS_PROC 0
  1406							 &config_noc SLAVE_QUP_1 0>;
  1407					power-domains = <&rpmhpd SA8775P_CX>;
  1408					operating-points-v2 = <&qup_opp_table_100mhz>;
  1409					status = "disabled";
  1410				};
  1411	
  1412				i2c11: i2c@a90000 {
  1413					compatible = "qcom,geni-i2c";
  1414					reg = <0x0 0xa90000 0x0 0x4000>;
  1415					#address-cells = <1>;
  1416					#size-cells = <0>;
  1417					interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
  1418					clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
  1419					clock-names = "se";
  1420					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1421							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1422							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1423							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1424							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1425							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1426					interconnect-names = "qup-core",
  1427							     "qup-config",
  1428							     "qup-memory";
  1429					power-domains = <&rpmhpd SA8775P_CX>;
  1430					status = "disabled";
  1431				};
  1432	
  1433				spi11: spi@a90000 {
  1434					compatible = "qcom,geni-spi";
  1435					reg = <0x0 0xa90000 0x0 0x4000>;
  1436					#address-cells = <1>;
  1437					#size-cells = <0>;
  1438					interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
  1439					clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
  1440					clock-names = "se";
  1441					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1442							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1443							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1444							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1445							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1446							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1447					interconnect-names = "qup-core",
  1448							     "qup-config",
  1449							     "qup-memory";
  1450					power-domains = <&rpmhpd SA8775P_CX>;
  1451					status = "disabled";
  1452				};
  1453	
  1454				i2c12: i2c@a94000 {
  1455					compatible = "qcom,geni-i2c";
  1456					reg = <0x0 0xa94000 0x0 0x4000>;
  1457					#address-cells = <1>;
  1458					#size-cells = <0>;
  1459					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
  1460					clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
  1461					clock-names = "se";
  1462					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1463							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1464							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1465							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1466							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1467							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1468					interconnect-names = "qup-core",
  1469							     "qup-config",
  1470							     "qup-memory";
  1471					power-domains = <&rpmhpd SA8775P_CX>;
  1472					status = "disabled";
  1473				};
  1474	
  1475				spi12: spi@a94000 {
  1476					compatible = "qcom,geni-spi";
  1477					reg = <0x0 0xa94000 0x0 0x4000>;
  1478					#address-cells = <1>;
  1479					#size-cells = <0>;
  1480					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
  1481					clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
  1482					clock-names = "se";
  1483					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1484							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1485							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1486							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1487							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1488							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1489					interconnect-names = "qup-core",
  1490							     "qup-config",
  1491							     "qup-memory";
  1492					power-domains = <&rpmhpd SA8775P_CX>;
  1493					status = "disabled";
  1494				};
  1495	
  1496				uart12: serial@a94000 {
  1497					compatible = "qcom,geni-uart";
  1498					reg = <0x0 0x00a94000 0x0 0x4000>;
  1499					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
  1500					clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
  1501					clock-names = "se";
  1502					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1503							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1504							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1505							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
  1506					interconnect-names = "qup-core", "qup-config";
  1507					power-domains = <&rpmhpd SA8775P_CX>;
  1508					status = "disabled";
  1509				};
  1510	
  1511				i2c13: i2c@a98000 {
  1512					compatible = "qcom,geni-i2c";
  1513					reg = <0x0 0xa98000 0x0 0x4000>;
  1514					#address-cells = <1>;
  1515					#size-cells = <0>;
  1516					interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
  1517					clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
  1518					clock-names = "se";
  1519					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1520							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1521							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1522							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
  1523							<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1524							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1525					interconnect-names = "qup-core",
  1526							     "qup-config",
  1527							     "qup-memory";
  1528					power-domains = <&rpmhpd SA8775P_CX>;
  1529					status = "disabled";
  1530				};
  1531			};
  1532	
  1533			qupv3_id_3: geniqup@bc0000 {
  1534				compatible = "qcom,geni-se-qup";
  1535				reg = <0x0 0xbc0000 0x0 0x6000>;
  1536				#address-cells = <2>;
  1537				#size-cells = <2>;
  1538				ranges;
  1539				clock-names = "m-ahb", "s-ahb";
  1540				clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
  1541					<&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
  1542				iommus = <&apps_smmu 0x43 0x0>;
  1543				status = "disabled";
  1544	
  1545				i2c21: i2c@b80000 {
  1546					compatible = "qcom,geni-i2c";
  1547					reg = <0x0 0xb80000 0x0 0x4000>;
  1548					#address-cells = <1>;
  1549					#size-cells = <0>;
  1550					interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
  1551					clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
  1552					clock-names = "se";
  1553					interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
  1554							&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
  1555						   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1556							&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
  1557						   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
  1558							&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1559					interconnect-names = "qup-core",
  1560								 "qup-config",
  1561								 "qup-memory";
  1562					power-domains = <&rpmhpd SA8775P_CX>;
  1563					status = "disabled";
  1564				};
  1565	
  1566				spi21: spi@b80000 {
  1567					compatible = "qcom,geni-spi";
  1568					reg = <0x0 0xb80000 0x0 0x4000>;
  1569					#address-cells = <1>;
  1570					#size-cells = <0>;
  1571					interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
  1572					clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
  1573					clock-names = "se";
  1574					interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
  1575							&clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
  1576						   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1577							&config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
  1578						   <&aggre1_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
  1579							&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1580					interconnect-names = "qup-core",
  1581								 "qup-config",
  1582								 "qup-memory";
  1583					power-domains = <&rpmhpd SA8775P_CX>;
  1584					status = "disabled";
  1585				};
  1586			};
  1587	
  1588			rng: rng@10d2000 {
  1589				compatible = "qcom,sa8775p-trng", "qcom,trng";
  1590				reg = <0 0x010d2000 0 0x1000>;
  1591			};
  1592	
  1593			ufs_mem_hc: ufs@1d84000 {
  1594				compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
  1595				reg = <0x0 0x01d84000 0x0 0x3000>;
  1596				interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
  1597				phys = <&ufs_mem_phy>;
  1598				phy-names = "ufsphy";
  1599				lanes-per-direction = <2>;
  1600				#reset-cells = <1>;
  1601				resets = <&gcc GCC_UFS_PHY_BCR>;
  1602				reset-names = "rst";
  1603				power-domains = <&gcc UFS_PHY_GDSC>;
  1604				required-opps = <&rpmhpd_opp_nom>;
  1605				iommus = <&apps_smmu 0x100 0x0>;
  1606				dma-coherent;
  1607				clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
  1608					 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
  1609					 <&gcc GCC_UFS_PHY_AHB_CLK>,
  1610					 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
  1611					 <&rpmhcc RPMH_CXO_CLK>,
  1612					 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
  1613					 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
  1614					 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
  1615				clock-names = "core_clk",
  1616					      "bus_aggr_clk",
  1617					      "iface_clk",
  1618					      "core_clk_unipro",
  1619					      "ref_clk",
  1620					      "tx_lane0_sync_clk",
  1621					      "rx_lane0_sync_clk",
  1622					      "rx_lane1_sync_clk";
  1623				freq-table-hz = <75000000 300000000>,
  1624						<0 0>,
  1625						<0 0>,
  1626						<75000000 300000000>,
  1627						<0 0>,
  1628						<0 0>,
  1629						<0 0>,
  1630						<0 0>;
  1631				qcom,ice = <&ice>;
  1632				status = "disabled";
  1633			};
  1634	
  1635			ufs_mem_phy: phy@1d87000 {
  1636				compatible = "qcom,sa8775p-qmp-ufs-phy";
  1637				reg = <0x0 0x01d87000 0x0 0xe10>;
  1638				/*
  1639				 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
  1640				 * enables the CXO clock to eDP *and* UFS PHY.
  1641				 */
  1642				clocks = <&rpmhcc RPMH_CXO_CLK>,
  1643					 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
  1644					 <&gcc GCC_EDP_REF_CLKREF_EN>;
  1645				clock-names = "ref", "ref_aux", "qref";
  1646				power-domains = <&gcc UFS_PHY_GDSC>;
  1647				resets = <&ufs_mem_hc 0>;
  1648				reset-names = "ufsphy";
  1649				#phy-cells = <0>;
  1650				status = "disabled";
  1651			};
  1652	
  1653			ice: crypto@1d88000 {
  1654				compatible = "qcom,sa8775p-inline-crypto-engine",
  1655					     "qcom,inline-crypto-engine";
  1656				reg = <0x0 0x01d88000 0x0 0x8000>;
  1657				clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
  1658			};
  1659	
  1660			csr: csr@4001000 {
  1661				compatible = "qcom,coresight-csr";
  1662				reg = <0x0 0x4001000 0x0 0x1000>;
  1663				reg-names = "csr-base";
  1664	
  1665				clocks = <&aoss_qmp>;
  1666				clock-names = "apb_pclk";
  1667	
  1668				in-ports {
  1669					#address-cells = <1>;
  1670					#size-cells = <0>;
  1671	
  1672					port@0 {
  1673						reg = <0>;
  1674						csr_in0: endpoint {
  1675							remote-endpoint =
  1676							<&etr0_out>;
  1677						};
  1678					};
  1679	
  1680					port@1 {
  1681						reg = <1>;
  1682						csr_in1: endpoint {
  1683							remote-endpoint =
  1684							<&etr1_out>;
  1685						};
  1686					};
  1687				};
  1688			};
  1689	
  1690			stm: stm@4002000 {
  1691				compatible = "arm,coresight-stm", "arm,primecell";
  1692				reg = <0x0 0x4002000 0x0 0x1000>,
  1693					  <0x0 0x16280000 0x0 0x180000>;
  1694				reg-names = "stm-base", "stm-stimulus-base";
  1695	
  1696				clocks = <&aoss_qmp>;
  1697				clock-names = "apb_pclk";
  1698	
  1699				out-ports {
  1700					port {
  1701						stm_out: endpoint {
  1702							remote-endpoint =
  1703							<&funnel0_in7>;
  1704						};
  1705					};
  1706				};
  1707			};
  1708	
  1709			tpdm@4003000 {
  1710				compatible = "qcom,coresight-tpdm", "arm,primecell";
  1711				reg = <0x0 0x4003000 0x0 0x1000>;
  1712	
  1713				clocks = <&aoss_qmp>;
  1714				clock-names = "apb_pclk";
  1715	
  1716				qcom,cmb-element-bits = <32>;
  1717				qcom,cmb-msrs-num = <32>;
  1718	
  1719				out-ports {
  1720					port {
  1721						qdss_tpdm0_out: endpoint {
  1722							remote-endpoint =
  1723							<&qdss_tpda_in0>;
  1724						};
  1725					};
  1726				};
  1727			};
  1728	
  1729			tpda@4004000 {
  1730				compatible = "qcom,coresight-tpda", "arm,primecell";
  1731				reg = <0x0 0x4004000 0x0 0x1000>;
  1732	
  1733				clocks = <&aoss_qmp>;
  1734				clock-names = "apb_pclk";
  1735	
  1736				out-ports {
  1737					port {
  1738						qdss_tpda_out: endpoint {
  1739							remote-endpoint =
  1740							<&funnel0_in6>;
  1741						};
  1742					};
  1743				};
  1744	
  1745				in-ports {
  1746					#address-cells = <1>;
  1747					#size-cells = <0>;
  1748	
  1749					port@0 {
  1750						reg = <0>;
  1751						qdss_tpda_in0: endpoint {
  1752							remote-endpoint =
  1753							<&qdss_tpdm0_out>;
  1754						};
  1755					};
  1756	
  1757					port@1 {
  1758						reg = <1>;
  1759						qdss_tpda_in1: endpoint {
  1760							remote-endpoint =
  1761							<&qdss_tpdm1_out>;
  1762						};
  1763					};
  1764				};
  1765			};
  1766	
  1767			tpdm@400f000 {
  1768				compatible = "qcom,coresight-tpdm", "arm,primecell";
  1769				reg = <0x0 0x400f000 0x0 0x1000>;
  1770	
  1771				clocks = <&aoss_qmp>;
  1772				clock-names = "apb_pclk";
  1773	
  1774				qcom,cmb-element-bits = <32>;
  1775				qcom,cmb-msrs-num = <32>;
  1776	
  1777				out-ports {
  1778					port {
  1779						qdss_tpdm1_out: endpoint {
  1780							remote-endpoint =
  1781							<&qdss_tpda_in1>;
  1782						};
  1783					};
  1784				};
  1785			};
  1786	
  1787			funnel@4041000 {
  1788				compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
  1789				reg = <0x0 0x4041000 0x0 0x1000>;
  1790	
  1791				clocks = <&aoss_qmp>;
  1792				clock-names = "apb_pclk";
  1793	
  1794				out-ports {
  1795					port {
  1796						funnel0_out: endpoint {
  1797							remote-endpoint =
  1798							<&qdss_funnel_in0>;
  1799						};
  1800					};
  1801				};
  1802	
  1803				in-ports {
  1804					#address-cells = <1>;
  1805					#size-cells = <0>;
  1806	
  1807					port@6 {
  1808						reg = <6>;
  1809						funnel0_in6: endpoint {
  1810							remote-endpoint =
  1811							<&qdss_tpda_out>;
  1812						};
  1813					};
  1814	
  1815					port@7 {
  1816						reg = <7>;
  1817						funnel0_in7: endpoint {
  1818							remote-endpoint =
  1819							<&stm_out>;
  1820						};
  1821					};
  1822				};
  1823			};
  1824	
  1825			funnel@4042000 {
  1826				compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
  1827				reg = <0x0 0x4042000 0x0 0x1000>;
  1828	
  1829				clocks = <&aoss_qmp>;
  1830				clock-names = "apb_pclk";
  1831	
  1832				out-ports {
  1833					port {
  1834						funnel1_out: endpoint {
  1835							remote-endpoint =
  1836							<&qdss_funnel_in1>;
  1837						};
  1838					};
  1839				};
  1840	
  1841				in-ports {
  1842					#address-cells = <1>;
  1843					#size-cells = <0>;
  1844	
  1845					port@4 {
  1846						reg = <4>;
  1847						funnel1_in4: endpoint {
  1848							remote-endpoint =
  1849							<&apss_funnel1_out>;
  1850						};
  1851					};
  1852				};
  1853			};
  1854	
  1855			funnel@4045000 {
  1856				compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
  1857				reg = <0x0 0x4045000 0x0 0x1000>;
  1858	
  1859				clocks = <&aoss_qmp>;
  1860				clock-names = "apb_pclk";
  1861	
  1862				out-ports {
  1863					port {
  1864						qdss_funnel_out: endpoint {
  1865							remote-endpoint =
  1866							<&aoss_funnel_in7>;
  1867						};
  1868					};
  1869				};
  1870	
  1871				in-ports {
  1872					#address-cells = <1>;
  1873					#size-cells = <0>;
  1874	
  1875					port@0 {
  1876						reg = <0>;
  1877						qdss_funnel_in0: endpoint {
  1878							remote-endpoint =
  1879							<&funnel0_out>;
  1880						};
  1881					};
  1882	
  1883					port@1 {
  1884						reg = <1>;
  1885						qdss_funnel_in1: endpoint {
  1886							remote-endpoint =
  1887							<&funnel1_out>;
  1888						};
  1889					};
  1890				};
  1891			};
  1892	
  1893			replicator@4046000 {
  1894				compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
  1895				reg = <0x0 0x4046000 0x0 0x1000>;
  1896	
  1897				clocks = <&aoss_qmp>;
  1898				clock-names = "apb_pclk";
  1899	
> 1900				out-ports {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

